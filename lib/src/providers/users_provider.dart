import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/entities/user_entity.dart';

part 'users_provider.g.dart';

@riverpod
class UsersProvider extends _$UsersProvider {
  @override
  UserEntity build() {
    return UserEntity.init();
  }

  void addUser(UserEntity user) {
    state = user;
  }

  void removeUser(UserEntity user) {
    state = user;
  }
}
