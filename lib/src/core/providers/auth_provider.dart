import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'auth_provider.g.dart';

// Create an AuthState class to handle different authentication states
sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class Authenticated extends AuthState {
  final UserEntity user;
  const Authenticated(this.user);
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}

@riverpod
class Auth extends _$Auth {
  final _firebaseAuth = auth;
  final _googleSignIn = GoogleSignIn();

  @override
  AuthState build() {
    // Listen to auth state changes and update the state accordingly
    _firebaseAuth.authStateChanges().listen((user) async {
      if (user != null) {
        try {
          final userDetails = await getUserDetails(user.uid);
          ref.read(usersProvider.notifier).addUser(userDetails);
          state = Authenticated(userDetails);
        } catch (e) {
          state = AuthError(e.toString());
        }
      } else {
        state = const Unauthenticated();
      }
    });

    return const AuthInitial();
  }

  Future<UserEntity> getUserDetails(String uid) async {
    try {
      final dbResponse = await db.collection("users").doc(uid).get();

      if (!dbResponse.exists) {
        throw 'User details not found';
      }

      final dbData = dbResponse.data()!;
      final hasAvatar = dbData["avatar"] as bool;
      Uint8List? avatar;

      if (hasAvatar) {
        final storageRef = storage.child("avatar/$uid.png");
        avatar = await storageRef.getData();
      }

      return UserEntity(
        id: uid,
        firstName: dbData["firstName"] ?? '',
        middleName: dbData["middleName"] ?? '',
        lastName: dbData["lastName"] ?? '',
        email: dbData["email"] ?? '',
        phoneNumber: dbData["phoneNumber"] ?? '',
        avatar: avatar,
        createdAt: DateTime.parse(dbData["createdAt"]),
        updatedAt: dbData["updatedAt"].isEmpty
            ? DateTime.now()
            : DateTime.parse(dbData["updatedAt"]),
      );
    } catch (e) {
      throw 'Failed to get user details: $e';
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      state = const AuthInitial(); // Show loading state

      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) throw 'Failed to create user';

      await credential.user!
          .updateDisplayName("$firstName $middleName $lastName");

      await db.collection("users").doc(credential.user!.uid).set({
        "email": email,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "avatar": false,
        "createdAt": DateTime.now().toIso8601String(),
        "updatedAt": ""
      });

      final userDetails = await getUserDetails(credential.user!.uid);
      state = Authenticated(userDetails);
    } on FirebaseAuthException catch (e) {
      state = AuthError(
        e.code == 'weak-password'
            ? 'The password provided is too weak.'
            : e.code == 'email-already-in-use'
                ? 'An account already exists for this email.'
                : e.message ?? 'An error occurred during sign up.',
      );
    } catch (e) {
      state = AuthError('An unexpected error occurred: $e');
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      state = const AuthInitial(); // Show loading state

      final authResponse = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResponse.user == null) throw 'Failed to sign in';

      final userDetails = await getUserDetails(authResponse.user!.uid);
      state = Authenticated(userDetails);
    } on FirebaseAuthException catch (e) {
      state = AuthError(e.message ?? 'An error occurred during sign in.');
    } catch (e) {
      state = AuthError('An unexpected error occurred: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      state = const AuthInitial(); // Show loading state

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        state = const AuthError('Google sign in was cancelled.');
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final response = await _firebaseAuth.signInWithCredential(credential);
      if (response.user == null) throw 'Failed to sign in with Google';

      final userDetails = await getUserDetails(response.user!.uid);
      state = Authenticated(userDetails);
    } catch (e) {
      state = AuthError('Failed to sign in with Google: $e');
    }
  }

  Future<void> signOut() async {
    try {
      state = const AuthInitial(); // Show loading state
      await Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);
      state = const Unauthenticated();
    } catch (e) {
      state = AuthError('Failed to sign out: $e');
    }
  }
}
