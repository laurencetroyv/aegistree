import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/components/index.dart';
import 'package:aegistree/src/pages/app/disease_details.dart';
import 'package:aegistree/src/providers/diseases_provider.dart';

class TypesOfDiseases extends ConsumerWidget {
  const TypesOfDiseases({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
    );

    final defaultShadow = BoxShadow(
      color: Colors.black.withOpacity(.25),
      blurRadius: 4,
      offset: const Offset(0, 4),
    );

    final diseases = ref.read(diseaseProvider);

    return Scaffold(
      appBar: const CustomImageAppBar(),
      body: Column(
        children: [
          const Gap(16),
          InknutAntiqua(
            "Types of Leaf Diseases",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            shadow: [defaultShadow],
          ),
          const Gap(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: diseases.length,
                itemBuilder: (context, index) {
                  final disease = diseases[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return DiseaseDetails(disease);
                        }),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFFFE9),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [defaultShadow],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 22,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Image.network(disease.image)),
                            const Gap(12),
                            Koho(
                              disease.name,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF247408),
                              textAlign: TextAlign.center,
                              shadow: [defaultShadow],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
