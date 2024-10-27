import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/providers/chart_provider.dart';

import 'chart_legend.dart';

class DiseaseDetectionChart extends ConsumerWidget {
  const DiseaseDetectionChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(chartProvider);
    late double totalDisease;

    if (data.isNotEmpty) {
      totalDisease =
          data.map((e) => e.value).reduce((value, element) => value + element);
    } else {
      totalDisease = 0;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 184,
          height: 184,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                ...data.map(
                  (value) {
                    return PieChartSectionData(
                      value: value.value,
                      color: value.color,
                      title: '${value.value}%',
                      radius: 40,
                      titleStyle: GoogleFonts.koHo(),
                    );
                  },
                ),
                if (data.isEmpty)
                  PieChartSectionData(
                    value: 1,
                    color: Colors.grey,
                    title: "Empty",
                    radius: 40,
                    titleStyle: GoogleFonts.koHo(),
                  ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...data.map((list) {
              return ChartLegend(
                title: list.name,
                count: '${list.value} Detected',
                color: list.color,
              );
            }),
            ChartLegend(
              title: "Total",
              count: '$totalDisease Detected Disease',
            ),
          ],
        ),
      ],
    );
  }
}
