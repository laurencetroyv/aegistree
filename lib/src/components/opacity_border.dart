import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpacityBorder extends ConsumerWidget {
  const OpacityBorder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 1,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF37A411).withOpacity(.31),
        ),
      ),
    );
  }
}
