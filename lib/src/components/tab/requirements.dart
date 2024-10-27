import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/components/index.dart';
import 'package:aegistree/src/components/leaf_grid.dart';
import 'package:aegistree/src/providers/leafs_provider.dart';

import 'requirements_item.dart';

class RequirementTab extends ConsumerWidget {
  final ScrollController scrollController;

  const RequirementTab(this.scrollController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leafs = ref.watch(leafsProvider);

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        const RequirementItem(
          label: 'Watered:',
          value:
              'The best time to water is in the morning, watering into the soil (not onto the plants) as this will help prevent the spread of the spores.',
        ),
        const Gap(4),
        const OpacityBorder(),
        const Gap(4),
        const RequirementItem(
          label: 'Fertilized:',
          value:
              'Avoid spraying when rain is expected or when plants are dry and suffering from moisture stress.',
        ),
        const Gap(4),
        const OpacityBorder(),
        const Gap(4),
        const RequirementItem(
          label: 'Leaves cleaned:',
          value:
              'Remove all infected plant material from the plant and the ground and dispose of in the rubbish.',
        ),
        const Gap(28),
        const OpacityBorder(),
        const Gap(4),
        LeafGrid(leafs)
      ],
    );
  }
}
