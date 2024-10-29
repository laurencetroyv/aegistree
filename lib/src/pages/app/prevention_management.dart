import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class PreventionManagement extends ConsumerWidget {
  const PreventionManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultShadow = BoxShadow(
      color: Colors.black.withOpacity(.25),
      blurRadius: 4,
      offset: const Offset(0, 4),
    );

    final content = [
      {
        "title": "Cultural Management",
        "page": const CulturalManagement(),
      },
      {
        "title": "Chemical Management",
        "page": const CulturalManagement(),
      },
      {
        "title": "Physical Management",
        "page": const CulturalManagement(),
      },
      {
        "title": "Biological Management",
        "page": const CulturalManagement(),
      },
    ];

    return Scaffold(
      appBar: const CustomImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InknutAntiqua(
              "Prevention and Management Strategies",
              textAlign: TextAlign.center,
              shadow: [defaultShadow],
              fontSize: 20,
            ),
            const Gap(24),
            Expanded(
              child: ListView.builder(
                itemCount: content.length,
                itemBuilder: (context, index) {
                  final prevention = content[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: PreventionManagementContainer(
                      title: prevention['title'] as String,
                      page: prevention['page'] as Widget,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
