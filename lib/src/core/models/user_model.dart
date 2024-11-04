import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  @id
  final int i = 1;
  final String uid;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final List<int>? avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    required this.uid,
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
