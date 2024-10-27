import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/components/chart.dart';
import 'package:aegistree/src/components/index.dart';
import 'package:aegistree/src/components/leaf_album.dart';
import 'package:aegistree/src/entities/entities.dart';
import 'package:aegistree/src/pages/app/diagnose.dart';
import 'package:aegistree/src/providers/leafs_provider.dart';
import 'package:aegistree/src/providers/users_provider.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(usersProviderProvider);

    final List<LeafEntity> leafs = ref.watch(leafsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            Text(
              "Hello ${user.firstWord}!",
              style: GoogleFonts.inknutAntiqua(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E1E1E),
                shadows: [
                  Shadow(
                    color: const Color(0xFF000000).withOpacity(.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
            ),
            const Gap(4),
            Text(
              "Your trees missed you!",
              style: GoogleFonts.inknutAntiqua(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(.58),
              ),
            ),
            const Gap(32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 187, 233, 170),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const DiseaseDetectionChart(),
            ),
            const Gap(32),
            Expanded(
              child: LeafAlbumGrid(
                leafs,
                maxImages: leafs.length <= 12 ? leafs.length : 12,
                title: "Leaf Album",
                moreButton: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const Diagnose();
            },
          ));
        },
        tooltip: 'Add New',
        label: Text(
          "+ Add New",
          style: GoogleFonts.koHo(fontSize: 20),
        ),
      ),
    );
  }
}
