import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  final FirebaseAuth firebaseAuth = auth;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void build() {
    return;
  }

  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      // Create the user with email and password
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update the user's display name
      await credential.user
          ?.updateDisplayName("$firstName $middleName $lastName");

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

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'An account already exists for this email.';
      }
      throw e.message ?? 'An error occurred during sign up.';
    } catch (e) {
      throw 'An unexpected error occurred.';
    }
  }

  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final id = authResponse.user!.uid;
      final dbResponse = await db.collection("users").doc(id).get();
      final dbData = dbResponse.data()!;
      final hasAvatar = dbData["avatar"] as bool;
      late Uint8List? avatar;

      if (hasAvatar) {
        final storageRef = storage.child("avatar/$id.png");
        avatar = await storageRef.getData();
      }

      final user = UserEntity(
        id: id,
        firstName: dbData["firstName"],
        middleName: dbData["middleName"],
        lastName: dbData["lastName"],
        email: dbData["email"],
        phoneNumber: dbData["phoneNumber"],
        avatar: hasAvatar ? avatar : null,
        createdAt: DateTime.parse(dbData["createdAt"]),
        updatedAt: DateTime.parse(dbData["updatedAt"]),
      );

      return user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An error occurred during sign in. $e';
    } catch (e) {
      throw 'An unexpected error occurred. $e';
    }
  }

  // Google Sign In
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw 'Google sign in was cancelled.';
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credentials
      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw 'Failed to sign in with Google: ${e.toString()}';
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
