import 'package:flutter/services.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class Users extends _$Users {
  @override
  UserEntity? build() {
    return null;
  }

  void addUser(UserEntity user) {
    state = user;
  }

  Future<void> updateAvatar(Uint8List byte) async {
    state = UserEntity(
      id: state!.id,
      firstName: state!.firstName,
      middleName: state!.middleName,
      lastName: state!.lastName,
      email: state!.email,
      phoneNumber: state!.phoneNumber,
      avatar: byte,
    );
  }

  void removeUser(UserEntity user) {
    state = user;
  }
}
