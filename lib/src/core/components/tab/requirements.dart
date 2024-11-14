import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/core/providers/solution_provider.dart';
import 'package:aegistree/src/src.dart';

class RequirementTab extends ConsumerWidget {
  final ScrollController scrollController;
  final String leaf;

  const RequirementTab(this.scrollController, {super.key, required this.leaf});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final solutions = ref.read(solutionProvider.notifier).getSolution(leaf);

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        RequirementItem(
          label: 'Watered:',
          value: solutions?.requirements.watered ??
              'The best time to water is in the morning, watering into the soil (not onto the plants) as this will help prevent the spread of the spores.',
        ),
        const Gap(4),
        const OpacityBorder(),
        const Gap(4),
        RequirementItem(
          label: 'Fertilized:',
          value: solutions?.requirements.fertilized ??
              'Avoid spraying when rain is expected or when plants are dry and suffering from moisture stress.',
        ),
        const Gap(4),
        const OpacityBorder(),
        const Gap(4),
        RequirementItem(
          label: 'Leaves cleaned:',
          value: solutions?.requirements.leavesCleaned ??
              'Remove all infected plant material from the plant and the ground and dispose of in the rubbish.',
        ),
      ],
    );
  }
}
