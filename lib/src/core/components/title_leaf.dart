import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class TitleLeaf extends ConsumerWidget {
  const TitleLeaf(this.title, {super.key, this.size = 32, this.color});

  final String title;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Image.asset('assets/images/small-leaf.png'),
        const Gap(4),
        InknutAntiqua(
          title,
          fontSize: 32,
          color: color,
          fontWeight: FontWeight.w500,
          shadow: [Shadows().defaultShadow],
        ),
      ],
    );
  }
}
