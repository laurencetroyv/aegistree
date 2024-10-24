import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/components/index.dart';

class ProfileInformation extends ConsumerWidget {
  const ProfileInformation({
    super.key,
    required this.title,
    required this.isEditing,
    required this.controller,
  });

  final String title;
  final TextEditingController controller;
  final bool isEditing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unEditableContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        Inter(
          title,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
        InknutAntiqua(
          controller.text,
          fontWeight: FontWeight.w500,
        ),
      ],
    );

    final editableContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        Inter(
          title,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: title,
          ),
        ),
      ],
    );

    return isEditing ? editableContent : unEditableContent;
  }
}
