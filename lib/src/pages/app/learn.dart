import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/components/index.dart';

import 'early_detection.dart';
import 'environmental_factors.dart';
import 'prevention_management.dart';
import 'types_of_diseases.dart';

class Learn extends ConsumerWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = [
      {
        "name": "Leaf Diseases",
        "icon": "diseases",
        "to": const TypesOfDiseases()
      },
      {
        "name": "Prevention & Management",
        "icon": "prevention",
        "to": const PreventionManagement(),
      },
      {
        "name": "Importance of Early Detection",
        "icon": "important",
        "to": const EarlyDetection()
      },
      {
        "name": "Environmental Factors",
        "icon": "environment",
        "to": const EnvironmentalFactors()
      }
    ];

    final defaultShadow = Shadow(
      color: Colors.black.withOpacity(.35),
      offset: const Offset(0, 4),
      blurRadius: 4,
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/learning-resources.png',
                      width: 132,
                      height: 145,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Koho("Why Trees?", fontWeight: FontWeight.bold),
                        const Gap(8),
                        const Karla(
                          "Trees help clean the air we breath, filter the water we drink, and provide habitat to over 80% of the world's terrestrial biodiversity. Forests provide jobs to over 1.6 billion people, absorb harmful carbon from the atmosphere, and are key ingredients in 25% of all medicines.",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        const Gap(8),
                        Koho(
                          "Read More",
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF37A411),
                          shadow: [defaultShadow],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(72),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 28,
                  mainAxisSpacing: 28,
                ),
                itemCount: content.length,
                itemBuilder: (context, index) {
                  final item = content[index];

                  return ResourceContainer(
                    item['name'] as String,
                    to: item['to'] as Widget,
                    icon: item['icon'] as String,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
