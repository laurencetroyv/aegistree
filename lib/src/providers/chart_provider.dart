import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/entities/entities.dart';
import 'package:aegistree/src/providers/album_provider.dart';

part 'chart_provider.g.dart';

@Riverpod(keepAlive: true)
class Chart extends _$Chart {
  final _chartColors = [
    const Color(0xFF45C27A),
    const Color(0xFFD6FCC9),
    const Color(0xFF94D13B),
    Colors.grey,
  ];

  @override
  List<ChartEntity> build() {
    final albums = ref.watch(albumProvider);

    if (albums.isEmpty) return [];

    final sortedAlbums = List<LeafAlbumEntity>.from(albums)
      ..sort((a, b) => b.leafs.length.compareTo(a.leafs.length));

    final charts = sortedAlbums.asMap().entries.map((value) {
      final index = value.key;
      final album = value.value;
      return ChartEntity(
        name: album.title,
        value: album.leafs.length.toDouble(),
        color: _chartColors[index <= 2 ? index : 3],
      );
    }).toList();

    final sortedCharts = List<ChartEntity>.from(charts)
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedCharts.length <= 3) {
      return sortedCharts;
    }

    final topDiseases = sortedCharts.take(3).toList();

    final othersValue = sortedCharts
        .skip(3)
        .map((e) => e.value)
        .reduce((value, element) => value + element);

    topDiseases.add(
      ChartEntity(
        name: "Others",
        value: othersValue,
        color: Colors.grey,
      ),
    );

    return topDiseases;
  }
}
