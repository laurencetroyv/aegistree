import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/src.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(usersProvider)!;

    final List<LeafEntity> leafs = ref.watch(leafsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            InknutAntiqua(
              "Hello ${user.firstWord}!",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              shadow: [Shadows().defaultShadow],
            ),
            const Gap(4),
            InknutAntiqua(
              "Your trees missed you!",
              fontWeight: FontWeight.w300,
              color: black60,
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
