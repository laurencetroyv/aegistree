import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/src.dart';

class LeafAlbum extends ConsumerWidget {
  const LeafAlbum({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(usersProvider)!;
    final albums = ref.watch(albumProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CircleAvatar(
          backgroundImage: MemoryImage(user.avatar!),
          radius: 24,
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            Text(
              "Leaf Diseases",
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
              "${user.firstWord}'s leaf collection",
              style: GoogleFonts.inknutAntiqua(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(.58),
              ),
            ),
            const Gap(32),
            Expanded(child: LeafAlbumCategories(albums: albums))
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
