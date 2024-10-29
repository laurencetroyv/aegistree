import 'package:flutter/services.dart';

class UserEntity {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final Uint8List? avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  String get firstWord =>
      firstName.length > 1 ? firstName.split(" ")[0] : firstName;

  String get fullName => "$firstName $middleName $lastName";
}
