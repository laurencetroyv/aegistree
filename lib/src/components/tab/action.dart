import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/components/index.dart';
import 'package:aegistree/src/components/leaf_grid.dart';
import 'package:aegistree/src/providers/leafs_provider.dart';

import 'action_item.dart';

class ActionTab extends ConsumerWidget {
  final ScrollController scrollController;

  const ActionTab(this.scrollController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leafs = ref.watch(leafsProvider);

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
        const ActionItem(
          label: 'Watered:',
          value: 'Water every morning',
        ),
        const ActionItem(
          label: 'Fertilized:',
          value: 'Spray with a suitable rust control',
        ),
        const ActionItem(
          label: 'Leaves cleaned:',
          value: 'Remove affected leaves',
        ),
        const Gap(28),
        const OpacityBorder(),
        const Gap(4),
        LeafGrid(leafs)
      ],
    );
  }
}
