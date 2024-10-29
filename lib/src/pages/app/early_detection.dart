import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class EarlyDetection extends ConsumerWidget {
  const EarlyDetection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultShadow = BoxShadow(
      color: Colors.black.withOpacity(.25),
      blurRadius: 4,
      offset: const Offset(0, 4),
    );

    const color = Color(0xFF185105);

    return Scaffold(
      appBar: const CustomImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            InknutAntiqua(
              "Prevention and Management Strategies",
              textAlign: TextAlign.center,
              shadow: [defaultShadow],
              fontSize: 20,
            ),
            const Gap(24),
            const Koho(
              "Early detection and treatment of tree diseases can have numerous benefits for both the environment and your personal property. By identifying and addressing disease threats early on, you can prevent further spread to nearby trees and reduce the risk of a large-scale outbreak. This not only helps preserve the health and beauty of your landscape but also saves you time, money, and effort in long-term management. Additionally, proactive measures such as pruning or removing infected trees can prevent potential hazards such as falling branches or weakened structures.",
              color: color,
            ),
            const Gap(12),
            const Koho(
              "Importance of early detection of tree sapling leaf diseases:",
              fontWeight: FontWeight.bold,
              color: color,
            ),
            const Gap(12),
            const NumberText(
              number: "1",
              "Prevention of Spread: Identifying diseases in their early stages allows for prompt intervention, preventing the spread of pathogens to other trees or plant species in the vicinity. Early detection helps contain outbreaks and mitigate potential epidemics, safeguarding the overall health of the ecosystem.",
            ),
            const Gap(6),
            const NumberText(
              number: "2",
              "Effective Treatment: Treating diseases in their initial phases is generally more successful and less resource-intensive compared to addressing advanced infections. Early detection enables targeted treatment strategies, such as pruning infected foliage, applying appropriate fungicides, or implementing cultural practices to enhance tree resistance.",
            ),
            const Gap(6),
            const NumberText(
              number: "3",
              "Preservation of Tree Health and Vitality: Healthy trees play a vital role in maintaining biodiversity, air quality, and ecological balance. By detecting and addressing leaf diseases early, you can preserve the vigor and vitality of saplings, ensuring their long-term survival and contribution to the ecosystem.",
            ),
            const Gap(6),
            const NumberText(
              number: "4",
              "Cost Savings: Early intervention is often more cost-effective than dealing with the consequences of unchecked disease progression. By investing in early detection measures, such as regular monitoring and timely diagnosis, you can minimize the need for extensive tree removal, replanting, and restoration efforts.",
            ),
            const Gap(6),
            const NumberText(
              number: "5",
              "Sustainability and Resilience: Proactive management of tree health fosters sustainable landscapes and resilient ecosystems. Early detection of leaf diseases supports the resilience of urban forests, agricultural orchards, and natural habitats, enhancing their ability to withstand environmental stresses and disturbances.",
            ),
            const Gap(6),
            const Koho(
              "In summary, early detection of tree sapling leaf diseases is essential for preserving ecosystem health, minimizing economic losses, and promoting sustainable management practices. By staying vigilant and proactive, you can effectively safeguard the well-being of trees and the environments they inhabit.",
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
