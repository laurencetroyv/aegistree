import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField(
    this.label, {
    super.key,
    this.obscure = false,
    this.isEmail = false,
    required this.controller,
  });

  final String label;
  final bool obscure;
  final TextEditingController controller;
  final bool isEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InknutAntiqua(label, fontWeight: FontWeight.w300),
        const Gap(8),
        TextField(
          obscureText: obscure,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFBED1BC),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
