import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/src.dart';

class CulturalManagement extends ConsumerWidget {
  const CulturalManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            Inter(
              "Cultural Management",
              textAlign: TextAlign.center,
              fontSize: 20,
            ),
            Gap(24),
            Karla(
              "The term cultural control describes the activities of humans aimed at controlling disease through the cultural manipulation of plants. At present, cultural control practices find their greatest value in large area and low unit value crops such as temperate cereals and forests. For some crops, such control practices may be the only economically viable methods available.",
            ),
            Gap(12),
            Inter("Cultural Management Practices:"),
            Gap(12),
            BulletText(
              "Sanitation",
              description:
                  "clean environment; remove or reduce sources of inoculum (weed and alternative hosts, insect vectors, debris).",
            ),
            Gap(6),
            BulletText(
              "Pruning",
              description:
                  "remove infected tissue, promote more vigorous growth, increase air circulation",
            ),
            Gap(6),
            BulletText(
              "Watering",
              description:
                  "avoid overwatering or underwatering; flooding soils.",
            ),
            Gap(6),
            BulletText(
              "Strip farming",
              description:
                  "this practice separates areas of one crop with intervening strips of another crop or fallow. Part of the rationale for adopting strip farming practices is that crops in adjacent strips rarely share common pathogens. The rates of spread of more specialised parasites are also restricted because of the discontinuous distribution of suitable hosts. The major problems associated with strip farming are increased costs of production relative to monocultures, selection of crops for adjacent strips which have few common parasites and weed control between the strips. Strip farming has an additional role in reducing soil erosion.",
            ),
            Gap(6),
            BulletText(
              "Planting date",
              description:
                  "unfavorable conditions for pathogen, favorable for host.",
            ),
            Gap(6),
            BulletText(
              "Fertility",
              description: "avoid overfertilization or underfertilization.",
            ),
            Gap(6),
            BulletText(
              "Rotation",
              description:
                  "The successive planting of different crops in the same area, is one of the oldest and most widespread cultural practices. It may also include a fallow period in which land is 'rested' from cultivation. Crop rotation improves soil fertility, moisture and texture and assists in weed and pathogen control. The most successful rotations employ intervals between susceptible crops which are longer than the known survival period of pathogens. Rotations are most likely to be effective in controlling pathogens such as GaeumannomAces graminis, Pgrenophoratritici-repentis, various CoLLetotri chumand Phoma spp. and some pathogenic bacteria which only survive in the presence of a specific host (or its residues) or as resistant propagules.",
            ),
            Gap(6),
            BulletText(
              "Roguing",
              description:
                  "involves the removal (and destruction) of diseased plants (rogues) to prevent further spread of the pathogen(s). It is practicable in small gardens, where labour is cheap or the cost of labour is not imporlant, when a crop is very valuable or if the level of infection is low. With larger plantings, roguing is only worthwhile if the crop has a relatively high economic value, the disease symptoms are conspicuous and the pathogen has a limited dispersal potential. To minimise disease spread, affected plants need to be removed as soon as possible after symptoms are observed. Roguing may need to be repeated regularly as newly diseased plants appear. Quarantines, restrictions on moving plant materials across county, state, or national borders.",
            ),
          ],
        ),
      ),
    );
  }
}
