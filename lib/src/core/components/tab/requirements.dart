import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class RequirementTab extends ConsumerWidget {
  final ScrollController scrollController;

  const RequirementTab(this.scrollController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: const [
        RequirementItem(
          label: 'Watered:',
          value:
              'The best time to water is in the morning, watering into the soil (not onto the plants) as this will help prevent the spread of the spores.',
        ),
        Gap(4),
        OpacityBorder(),
        Gap(4),
        RequirementItem(
          label: 'Fertilized:',
          value:
              'Avoid spraying when rain is expected or when plants are dry and suffering from moisture stress.',
        ),
        Gap(4),
        OpacityBorder(),
        Gap(4),
        RequirementItem(
          label: 'Leaves cleaned:',
          value:
              'Remove all infected plant material from the plant and the ground and dispose of in the rubbish.',
        ),
      ],
    );
  }
}
