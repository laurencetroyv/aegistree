import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/src.dart';

class LeafAlbumGrid extends ConsumerWidget {
  const LeafAlbumGrid(
    this.leafs, {
    super.key,
    this.maxImages,
    this.paddingBottom = false,
    required this.title,
    this.moreButton = false,
  });

  final List<LeafEntity> leafs;
  final int? maxImages;
  final String title;
  final bool moreButton;
  final bool paddingBottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = leafs.length;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.koHo(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "$length leave${length > 2 ? 's' : ''}",
                  style: GoogleFonts.koHo(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF504F4F),
                  ),
                ),
              ],
            ),
            if (moreButton && leafs.isNotEmpty)
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeafAlbum(),
                      ));
                },
                child: Text(
                  "More",
                  style: GoogleFonts.koHo(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF504F4F),
                  ),
                ),
              )
          ],
        ),
        const Gap(8),
        if (leafs.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: maxImages ?? leafs.length,
            itemBuilder: (context, index) {
              final id = leafs[index].id.split("-")[0];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LeafDetails(leafs[index], collectionName: title);
                    },
                  ));
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor,
                        image: DecorationImage(
                          image: MemoryImage(leafs[index].image),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          id,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        else
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 187, 233, 170),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: const Center(child: InknutAntiqua("No  leafs yet")),
          ),
        if (paddingBottom) const Gap(16)
      ],
    );
  }
}
