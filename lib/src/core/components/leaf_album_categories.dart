import 'package:flutter/material.dart';

import 'package:aegistree/src/src.dart';

class LeafAlbumCategories extends StatelessWidget {
  final List<LeafAlbumEntity> albums;

  const LeafAlbumCategories({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return LeafAlbumGrid(
          album.leafs,
          title: album.title,
          paddingBottom: true,
        );
      },
    );
  }
}
