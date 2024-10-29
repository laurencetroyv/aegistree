import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/plant-hand.png'),
          ),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 96,
              left: 16,
              right: 16,
              child: TitleLeaf("Welcome", size: 32),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                  gradient: gradient,
                ),
              ),
            ),
            Positioned(
              bottom: 96,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignIn();
                          },
                        ));
                      },
                      child: InknutAntiqua(
                        "Log In",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        shadow: [Shadows().defaultShadow],
                      ),
                    ),
                  ),
                  const Gap(12),
                  SizedBox(
                    width: 200,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignUp();
                          },
                        ));
                      },
                      child: InknutAntiqua(
                        "Sign Up",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        shadow: [Shadows().defaultShadow],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
