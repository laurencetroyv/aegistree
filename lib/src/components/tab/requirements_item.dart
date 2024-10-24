import 'package:flutter/material.dart';

import 'package:aegistree/src/components/index.dart';

class RequirementItem extends StatelessWidget {
  final String label;
  final String value;

  const RequirementItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Incosolata(
            label,
            color: Colors.black.withOpacity(.58),
            fontWeight: FontWeight.w500,
          ),
        ),
        Incosolata(
          value,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1E1E1E),
        ),
      ],
    );
  }
}
