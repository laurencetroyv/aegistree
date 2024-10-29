import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

import 'package:aegistree/src/src.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignIn> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Image.asset(
                  'assets/images/plant-hand-bg.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const Expanded(flex: 6, child: SizedBox()),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 8,
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.7,
            maxChildSize: 0.9,
            initialChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: gradient,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleLeaf(
                        "Sign In",
                        size: 28,
                        color: Color(0xFF504F4F),
                      ),
                      const Gap(32),
                      CustomTextField(
                        "Email Address",
                        controller: email,
                        isEmail: true,
                      ),
                      const Gap(16),
                      CustomTextField(
                        "Password",
                        controller: password,
                        obscure: true,
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(kUnimplementedFeature),
                                ),
                              );
                            },
                            child: InknutAntiqua(
                              "Forgot Password",
                              color: black60,
                            ),
                          )
                        ],
                      ),
                      const Gap(32),
                      FilledButton(
                        onPressed: _handleEmailSignI,
                        child: const InknutAntiqua("Sign In"),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        label: const InknutAntiqua("Login via Google"),
                        icon: const Icon(Ionicons.logo_google),
                      ),
                      const Gap(4),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUp();
                            },
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InknutAntiqua(
                              "Don't have an account? ",
                              color: const Color(0xFF1E1E1E).withOpacity(.5),
                            ),
                            const InknutAntiqua(
                              "Sign up",
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                      const Gap(32),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _handleEmailSignI() async {
    setState(() => isLoading = true);

    try {
      final response =
          await ref.read(authProvider.notifier).signInWithEmailAndPassword(
                email: email.text.trim(),
                password: password.text,
              );

      ref.read(usersProvider.notifier).addUser(response);
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }
}
