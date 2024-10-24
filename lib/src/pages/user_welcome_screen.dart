import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/entities/user_entity.dart';

class UserWelcomeScreen extends ConsumerWidget {
  const UserWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserEntity user = UserEntity.init();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),

          // Tinted image
          Positioned.fill(
            top: 64,
            child: Image.asset(
              'assets/images/plant-hand.png',
              fit: BoxFit.fitWidth,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFC5FBB3).withOpacity(0.65),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Another tinted view
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 64,
            // height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/small-leaf.png'),
                Text(
                  "Hello ${user.firstWord}!",
                  style: GoogleFonts.inknutAntiqua(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          color: Colors.black.withOpacity(.75),
                          offset: const Offset(0, 4),
                          blurRadius: 4)
                    ],
                  ),
                ),
                const Gap(64),
                Image.asset(
                  'assets/images/temp_profile.png',
                  width: 130,
                  height: 130,
                ),
                const Gap(32),
                FilledButton(
                  onPressed: () {},
                  child: const Text("Change Profile Picture"),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 64,
            left: 0,
            right: 0,
            child: Column(
              children: [
                FilledButton(
                    onPressed: () {}, child: const Text("Upload Picture")),
                TextButton(onPressed: () {}, child: const Text("Skip"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
