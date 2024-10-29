import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class EnvironmentalFactors extends ConsumerWidget {
  const EnvironmentalFactors({super.key});

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
              "Environmental Factors",
              textAlign: TextAlign.center,
              shadow: [defaultShadow],
              fontSize: 20,
            ),
            const Gap(24),
            const NumberText(
              number: "1",
              "Climate Conditions: Extreme temperatures, fluctuations in humidity levels, and prolonged periods of rainfall or drought can create favorable conditions for the proliferation of fungal, bacterial, and viral pathogens that cause leaf diseases.",
            ),
            const Gap(6),
            const NumberText(
              number: "2",
              "Moisture and Water Availability: Excessive moisture on leaves, either from rainfall, irrigation, or high humidity, can promote the growth of pathogens and create a conducive environment for disease development. Poor drainage and waterlogged soil can also contribute to fungal infections.",
            ),
            const Gap(6),
            const NumberText(
              number: "3",
              "Air Pollution: Pollutants such as sulfur dioxide, ozone, and nitrogen oxides can weaken tree immune systems and increase susceptibility to diseases. Additionally, air pollution can create stress on trees, making them more vulnerable to pathogens.",
            ),
            const Gap(6),
            const NumberText(
              number: "4",
              "Soil Conditions: Soilborne pathogens and nutrient deficiencies can affect tree health and contribute to the development of leaf diseases. Compacted or poorly aerated soil, as well as imbalances in soil pH and nutrient levels, can weaken trees and make them more susceptible to infections.",
            ),
            const Gap(6),
            const NumberText(
              number: "5",
              "Invasive Species: Invasive pests and pathogens, introduced through international trade or human activities, can rapidly spread and cause significant damage to tree populations. These organisms often lack natural predators and can devastate native vegetation.",
            ),
            const Gap(6),
            const NumberText(
              number: "6",
              "Urbanization and Land Use Changes: Urbanization, deforestation, and changes in land use can disrupt natural ecosystems, leading to increased stress on trees and higher incidences of leaf diseases. Fragmentation of habitats can also facilitate the spread of pathogens between tree species.",
            ),
            const Gap(6),
            const NumberText(
              number: "7",
              "Cultural Practices: Improper planting techniques, overuse of fertilizers or pesticides, and inadequate pruning can weaken trees and compromise their ability to resist diseases. Poor maintenance practices can create entry points for pathogens and exacerbate the spread of infections.",
            ),
            const Gap(6),
            const NumberText(
              number: "8",
              "Host Susceptibility: Certain tree species or cultivars may be inherently more susceptible to specific leaf diseases due to genetic factors. Planting diverse species and selecting disease-resistant cultivars can help reduce the impact of pathogens on tree populations.",
            ),
            const Gap(6),
            const Koho(
              "Understanding and managing these environmental factors is essential for effective disease prevention and control strategies in tree populations. Implementing practices that promote tree vigor, enhance resilience, and minimize stress can help mitigate the risk of leaf diseases and ensure the long-term health of forested landscapes.",
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
