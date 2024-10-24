class UserEntity {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  factory UserEntity.init() {
    const defaultID = "89cd12a4-161f-4250-864e-7817f4c68114";
    return UserEntity(
      avatar: "https://robohash.org/$defaultID?set=set4",
      id: defaultID,
      firstName: "Laurence Troy",
      middleName: " Sambaan",
      lastName: "Valdez",
      email: "laurencetroyv@gmail.com",
      phoneNumber: "09262309684",
    );
  }

  String get firstWord =>
      firstName.length > 1 ? firstName.split(" ")[0] : firstName;

  String get fullName => "$firstName $middleName $lastName";
}
