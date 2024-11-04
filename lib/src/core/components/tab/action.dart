import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/src.dart';

class ActionTab extends ConsumerWidget {
  final ScrollController scrollController;

  const ActionTab(this.scrollController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: const [
        Incosolata(
          'Recommended',
          textAlign: TextAlign.end,
          fontWeight: FontWeight.w600,
        ),
        OpacityBorder(),
        SizedBox(height: 16),
        ActionItem(
          label: 'Watered:',
          value: 'Water every morning',
        ),
        ActionItem(
          label: 'Fertilized:',
          value: 'Spray with a suitable rust control',
        ),
        ActionItem(
          label: 'Leaves cleaned:',
          value: 'Remove affected leaves',
        ),
      ],
    );
  }
}
