import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'chart_provider.g.dart';

@Riverpod(keepAlive: true)
class Chart extends _$Chart {
  final _chartColors = [
    const Color(0xFF45C27A),
    const Color(0xFF4285F4),
    const Color(0xFFDB4437),
    const Color(0xFFF4B400),
    const Color(0xFF0F9D58),
    const Color(0xFF9C27B0),
    const Color(0xFF00ACC1),
    const Color(0xFFFF7043),
    const Color(0xFF795548),
    const Color(0xFF607D8B),
    const Color(0xFFE91E63),
    const Color(0xFF3F51B5),
    const Color(0xFF009688),
    const Color(0xFFFF5722),
    const Color(0xFF673AB7),
  ];

  Color _getColor(int index) {
    if (index >= _chartColors.length) {
      return HSLColor.fromAHSL(
        1.0,
        (index * 137.508) % 360,
        0.7,
        0.5,
      ).toColor();
    }
    return _chartColors[index];
  }

  @override
  List<ChartEntity> build() {
    final albums = ref.watch(albumProvider);

    if (albums.isEmpty) return [];

    // Group data by month
    final monthlyData = <String, Map<String, int>>{};

    for (var album in albums) {
      for (var leaf in album.leafs) {
        final month = _getMonthName(leaf.createdAt.month);
        monthlyData.putIfAbsent(month, () => {});

        final diseaseData = monthlyData[month]!;
        diseaseData[album.title] = (diseaseData[album.title] ?? 0) + 1;
      }
    }

    // Convert to chart entities
    final charts = <ChartEntity>[];
    monthlyData.forEach((month, diseases) {
      diseases.forEach((disease, count) {
        charts.add(ChartEntity(
          name: disease,
          month: month,
          value: count.toDouble(),
          color: _getColor(albums.indexWhere((a) => a.title == disease)),
        ));
      });
    });

    return charts;
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}
