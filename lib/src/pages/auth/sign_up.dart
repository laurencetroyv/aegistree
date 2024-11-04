import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

import 'package:aegistree/src/src.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
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
                        "Log In",
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
                      const Gap(16),
                      CustomTextField(
                        "First Name",
                        controller: firstName,
                      ),
                      const Gap(16),
                      CustomTextField(
                        "Middle Name",
                        controller: middleName,
                      ),
                      const Gap(16),
                      CustomTextField(
                        "Last Name",
                        controller: lastName,
                      ),
                      const Gap(16),
                      CustomTextField(
                        "Phone Number",
                        controller: phoneNumber,
                      ),
                      const Gap(32),
                      FilledButton(
                        onPressed: _handleEmailSignUp,
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : const InknutAntiqua("Sign Up"),
                      ),
                      const Gap(4),
                      OutlinedButton.icon(
                        onPressed: _handleGoogleSignIn,
                        label: const InknutAntiqua("Signup via Google"),
                        icon: const Icon(Ionicons.logo_google),
                      ),
                      const Gap(4),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InknutAntiqua(
                              "Already have an account? ",
                              color: const Color(0xFF1E1E1E).withOpacity(.5),
                            ),
                            const InknutAntiqua(
                              "Log in",
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

  Future<void> _handleEmailSignUp() async {
    if (!_validateInputs()) return;

    setState(() => isLoading = true);

    try {
      await ref.read(authProvider.notifier).signUpWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text,
            firstName: firstName.text.trim(),
            middleName: middleName.text.trim(),
            lastName: lastName.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
          );

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

  Future<void> _handleGoogleSignIn() async {
    setState(() => isLoading = true);

    try {
      await ref.read(authProvider.notifier).signInWithGoogle();
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

  bool _validateInputs() {
    if (email.text.isEmpty || !email.text.contains('@')) {
      _showError('Please enter a valid email address');
      return false;
    }
    if (password.text.isEmpty || password.text.length < 6) {
      _showError('Password must be at least 6 characters');
      return false;
    }
    if (firstName.text.isEmpty) {
      _showError('Please enter your first name');
      return false;
    }
    if (middleName.text.isEmpty) {
      _showError('Please enter your middle name');
      return false;
    }
    if (lastName.text.isEmpty) {
      _showError('Please enter your last name');
      return false;
    }
    if (phoneNumber.text.isEmpty) {
      _showError('Please enter your phone number');
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    email.dispose();
    firstName.dispose();
    middleName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }
}
