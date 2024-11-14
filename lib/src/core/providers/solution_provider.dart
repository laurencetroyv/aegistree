import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'solution_provider.g.dart';

@Riverpod(keepAlive: true)
class Solution extends _$Solution {
  @override
  List<SolutionEntity> build() {
    return [
      SolutionEntity(
        name: "Black Rot",
        solution:
            "To manage the disease, remove and destroy infected plants immediately to prevent spread, and improve airflow by spacing plants properly. Water at the base to avoid splashing bacteria onto healthy plants and practice crop rotation to limit the bacteria's survival in soil. Copper-based bactericides or products containing beneficial bacteria like Streptomyces can help control the disease. Additionally, choosing resistant plant varieties, providing balanced fertilization, and minimizing plant stress will promote healthier, more disease-resistant crops. Regular monitoring and good sanitation practices, such as disinfecting tools, are also crucial for preventing further infection.",
        learnMore:
            """The disease is present throughout the world. The first symptoms, however, usually appear in the field as large, often V-shaped, chlorotic blotches at the margins of the leaves. The chlorosis progresses toward the midrib of the leaf, while some of the veins and veinlets within the chlorotic area turn black. The affected area later turns brown and dry. In the meantime, the blackening of the veins advances to the stem and from there upward and downward to other leaves and roots. When leaves become invaded systemically from bacteria moving upward through the midvein, chlorotic areas may appear anywhere on the leaves. Infected leaves may fall off prematurely one after the other.
The Black rot bacteria infect cotyledons or young leaves through stomata, hydathodes, or wounds and spread through them intercellularly until they reach the open ends of outer vessels, which they invade. Bacteria often ooze to the surface of the leaves through hydathodes or wounds and are subsequently spread by rain splashes and wind or are carried by equipment, to other leaves, which they infect. In wet, warm weather, infection develops rapidly, and visible symptoms may appear within hours.
""",
        actions: ActionEntity(
          watered: "Water the plant at the base, avoiding wetting the leaves.",
          fertilized:
              "Apply a balanced fertilizer to support healthy growth without promoting excessive foliage.",
          leavesCleaned:
              "Remove and dispose of infected or fallen leaves to prevent the spread of black rot.",
        ),
        requirements: ActionEntity(
          watered:
              "Use drip irrigation or a soaker hose system, ensuring the soil is moist but well-drained. Avoid overhead watering, which increases moisture on leaves and promotes fungal growth.",
          fertilized:
              "Avoid high-nitrogen fertilizers, which can lead to overly lush foliage that is more vulnerable to disease.",
          leavesCleaned:
              "Regularly inspect plants for new signs of infection and remove affected leaves immediately.",
        ),
      ),
      SolutionEntity(
        name: "Bacterial Spot",
        solution:
            "The control of bacterial spots can be obtained to some extent by the use of resistant varieties, crop rotation, and sanitation. Some control can be obtained by spraying several times during the period of plant susceptibility with chemicals such as copper compounds mixed with zineb, maneb, or mancozeb, antibiotics such as streptomycin and tetracyclines, and, in some cases, with plant defense activators.",
        learnMore:
            """It may cause serious losses by reducing the marketability of the fruit and by weakening trees through leaf spots, defoliation, and lesions on twigs. 
Symptoms appear on the leaves as circular to irregular, water-soaked spots about 1 to 5 millimeters in diameter, which later turn purple or brown. Often halos and cracks develop around the spots, and the affected areas break away from the surrounding healthy tissue, drop out, and give a shot-ridden appearance, known as shot hole, to the leaves.Several spots may coalesce. Severely affected leaves turn yellow and drop.
In the spring they ooze out and are spread by rain splashes and insects to young leaves, fruits, and twigs, which they infect through natural openings, leaf scars, and wounds. The disease is more severe on weakened trees than on vigorous ones: therefore, keeping trees in good vigor helps them resist the disease.
""",
        actions: ActionEntity(
          watered:
              "Water plants at the base to prevent splashing, which can spread bacteria to other parts of the plant and nearby plants.",
          fertilized:
              "Apply a balanced, moderate fertilizer to strengthen plant defenses without promoting excessive, vulnerable foliage.",
          leavesCleaned:
              "Remove and dispose of any infected leaves and plant debris to reduce bacterial spread.",
        ),
        requirements: ActionEntity(
          watered:
              "Ensure plants have adequate moisture, but avoid overhead watering, especially during warm, humid conditions when bacteria spread most easily.",
          fertilized:
              "Use a fertilizer with balanced nutrients, applying it early in the growing season.",
          leavesCleaned:
              "Prune infected leaves with sterilized tools and immediately discard them away from the garden area.",
        ),
      ),
    ];
  }

  SolutionEntity? getSolution(String name) {
    try {
      return state.firstWhere(
        (solution) =>
            solution.name.toLowerCase().trim() == name.toLowerCase().trim(),
      );
    } catch (e) {
      return null; // Returns null if no solution is found
    }
  }
}
