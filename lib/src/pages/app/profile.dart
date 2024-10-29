import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/src.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final emailAddress = TextEditingController();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController();
  final fullName = TextEditingController();
  bool isEditing = false;
  late final UserEntity user;

  @override
  void initState() {
    user = ref.read(usersProvider)!;
    emailAddress.text = user.email;
    firstName.text = user.firstName;
    middleName.text = user.middleName;
    lastName.text = user.lastName;
    phoneNumber.text = user.phoneNumber;
    fullName.text = user.fullName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFC4FAB2),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 16, width: double.infinity),
                const Inter("Profile", fontWeight: FontWeight.w600),
                const Gap(16),
                CircleAvatar(
                  backgroundImage: user.avatar != null
                      ? MemoryImage(user.avatar!)
                      : const AssetImage('assets/images/temp_profile.png'),
                  radius: 65,
                ),
                const Gap(16),
                InknutAntiqua(
                  user.fullName,
                  shadow: [
                    Shadow(
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                      color: Colors.black.withOpacity(.25),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              top: 240,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Container(
                  decoration: const BoxDecoration(gradient: gradient),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileInformation(
                          title: "Email Address",
                          controller: emailAddress,
                          isEditing: isEditing,
                        ),
                        if (!isEditing)
                          ProfileInformation(
                            title: "Full Name",
                            controller: fullName,
                            isEditing: isEditing,
                          ),
                        if (isEditing)
                          ProfileInformation(
                            title: "First Name",
                            controller: firstName,
                            isEditing: isEditing,
                          ),
                        if (isEditing)
                          ProfileInformation(
                            title: "Middle Name",
                            controller: middleName,
                            isEditing: isEditing,
                          ),
                        if (isEditing)
                          ProfileInformation(
                            title: "Last Name",
                            controller: lastName,
                            isEditing: isEditing,
                          ),
                        ProfileInformation(
                          title: "Phone Number",
                          controller: phoneNumber,
                          isEditing: isEditing,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 88,
              right: 88,
              child: FilledButton(
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    GoogleFonts.koHo().copyWith(fontWeight: FontWeight.bold),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: !isEditing ? _editBtn : _saveBtn,
                child: isEditing
                    ? const Koho("Save Profile")
                    : const Koho("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editBtn() {
    setState(() {
      isEditing = true;
    });
  }

  void _saveBtn() {
    setState(() {
      isEditing = false;
    });

    final data = UserEntity(
      id: user.id,
      firstName: firstName.text,
      middleName: middleName.text,
      lastName: lastName.text,
      email: emailAddress.text,
      phoneNumber: phoneNumber.text,
      avatar: user.avatar,
      createdAt: user.createdAt,
      updatedAt: DateTime.now(),
    );

    ref.read(usersProvider.notifier).addUser(data);
  }
}
