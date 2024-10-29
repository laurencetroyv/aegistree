import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class ChartLegend extends ConsumerWidget {
  const ChartLegend({
    super.key,
    required this.title,
    required this.count,
    this.color,
  });
  final String title;
  final String count;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorWidget = Container(
      width: 25,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );

    final parts = title.split(" ");

    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Koho(
          // add ... if title exceeds to 17 characters
          parts.length > 2 ? "${parts[0]} ${parts[1]}..." : title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black45,
        ),
        Text(
          count,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        ),
      ],
    );

    return color != null
        ? Row(
            children: [
              colorWidget,
              const Gap(8),
              details,
            ],
          )
        : details;
  }
}
