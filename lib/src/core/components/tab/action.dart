import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/core/providers/solution_provider.dart';
import 'package:aegistree/src/src.dart';

class ActionTab extends ConsumerWidget {
  final ScrollController scrollController;
  final String leaf;

  const ActionTab(this.scrollController, {super.key, required this.leaf});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final solutions = ref.read(solutionProvider.notifier).getSolution(leaf);
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        const Incosolata(
          'Recommended',
          textAlign: TextAlign.end,
          fontWeight: FontWeight.w600,
        ),
        const OpacityBorder(),
        const SizedBox(height: 16),
        ActionItem(
          label: 'Watered:',
          value: solutions?.actions.watered ?? 'Water every morning',
        ),
        ActionItem(
          label: 'Fertilized:',
          value: solutions?.actions.fertilized ??
              'Spray with a suitable rust control',
        ),
        ActionItem(
          label: 'Leaves cleaned:',
          value: solutions?.actions.leavesCleaned ?? 'Remove affected leaves',
        ),
      ],
    );
  }
}
