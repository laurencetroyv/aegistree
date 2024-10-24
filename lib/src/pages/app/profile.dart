import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/components/index.dart';
import 'package:aegistree/src/entities/user_entity.dart';
import 'package:aegistree/src/providers/users_provider.dart';

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
  bool isEditing = false;
  late final UserEntity user;

  @override
  void initState() {
    user = ref.read(usersProviderProvider);
    emailAddress.text = user.email;
    firstName.text = user.firstName;
    middleName.text = user.middleName;
    lastName.text = user.lastName;
    phoneNumber.text = user.phoneNumber;
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
                  backgroundImage: NetworkImage(user.avatar),
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
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.38, 1.0],
                      colors: [
                        Color(0xFFC5FBB3),
                        Color(0x00C5FBB3),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileInformation(
                          title: "Email Address",
                          controller: emailAddress,
                          isEditing: isEditing,
                        ),
                        if (!isEditing)
                          ProfileInformation(
                            title: "Full Name",
                            controller: firstName,
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
                onPressed: () {
                  setState(() {
                    isEditing = true;
                  });
                },
                child: const Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
