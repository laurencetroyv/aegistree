import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class DiseaseDetails extends ConsumerWidget {
  const DiseaseDetails(this.disease, {super.key});
  final DiseaseEntity disease;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(articleProvider);

    final defaultShadow = BoxShadow(
      color: Colors.black.withOpacity(.25),
      blurRadius: 4,
      offset: const Offset(0, 4),
    );

    return Scaffold(
      appBar: const CustomImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InknutAntiqua(
              "What is ${disease.name}",
              textAlign: TextAlign.center,
              shadow: [defaultShadow],
              fontSize: 20,
            ),
            const Gap(24),
            Row(
              children: [
                Image.memory(
                  disease.image,
                  width: 100,
                  height: 100,
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                    children: [
                      Karla(
                        disease.description,
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
                ),
              ],
            ),
            const Gap(24),
            InknutAntiqua(
              "Related Article",
              textAlign: TextAlign.center,
              shadow: [defaultShadow],
              fontSize: 20,
            ),
            const Gap(16),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleContainer(article);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
