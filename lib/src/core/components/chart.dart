import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/core/components/empty_chart.dart';
import 'package:aegistree/src/src.dart';

class DiseaseDetectionChart extends ConsumerStatefulWidget {
  const DiseaseDetectionChart({super.key});

  @override
  ConsumerState<DiseaseDetectionChart> createState() =>
      _DiseaseDetectionChartState();
}

class _DiseaseDetectionChartState extends ConsumerState<DiseaseDetectionChart> {
  String? selectedDisease;
  late int currentMonthIndex;

  @override
  void initState() {
    super.initState();
    // Set default month to current month
    final now = DateTime.now();
    currentMonthIndex = now.month - 1; // 0-based index (Jan = 0, Dec = 11)
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(chartProvider);

    final allMonths = [
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
      'Dec',
    ];

    if (currentMonthIndex >= allMonths.length) {
      currentMonthIndex = allMonths.length - 1;
    } else if (currentMonthIndex < 0) {
      currentMonthIndex = 0;
    }

    final currentMonth = allMonths[currentMonthIndex];

    final diseases = data.map((e) => e.name).toSet().toList();

    final currentMonthData =
        data.where((item) => item.month == currentMonth).toList();

    Widget monthNavigation = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              currentMonthIndex = (currentMonthIndex - 1) % 12;
              if (currentMonthIndex < 0) {
                currentMonthIndex = 11; // Handle negative index
              }
            });
          },
        ),
        Container(
          width: 100,
          alignment: Alignment.center,
          child: Text(
            currentMonth,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              currentMonthIndex = (currentMonthIndex + 1) % 12;
            });
          },
        ),
      ],
    );

    if (currentMonthData.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [monthNavigation, EmptyChart()],
      );
    }

    final totalDiseasesForMonth = currentMonthData.fold<double>(
      0,
      (sum, item) => sum + item.value,
    );

    final totalDiseases = data.fold<double>(0, (sum, item) => sum + item.value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        monthNavigation,
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    if (groupIndex < diseases.length) {
                      return BarTooltipItem(
                        '${diseases[groupIndex]}\n',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${rod.toY.toInt()} Detected',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    }
                    return null;
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Diseases',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Diseases',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) {
                      if (value == value.toInt() && value >= 0) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                horizontalInterval: 20,
              ),
              barGroups:
                  diseases.asMap().entries.map((entry) {
                    final index = entry.key;
                    final disease = entry.value;

                    final diseaseData = currentMonthData.firstWhere(
                      (d) => d.name == disease,
                    );

                    final barOpacity =
                        selectedDisease == null || selectedDisease == disease
                            ? 1.0
                            : 0.3;

                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: diseaseData.value,
                          color: diseaseData.color.withOpacity(barOpacity),
                          width: 20,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Disease legends
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                diseases.map((disease) {
                  final diseaseData = currentMonthData.where(
                    (d) => d.name == disease,
                  );
                  final value =
                      diseaseData.isEmpty ? 0 : diseaseData.first.value;

                  final Color diseaseColor =
                      currentMonthData
                          .firstWhere(
                            (d) => d.name == disease,
                            orElse: () => currentMonthData.first,
                          )
                          .color;

                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDisease =
                              selectedDisease == disease ? null : disease;
                        });
                      },
                      child: ChartLegend(
                        title: disease,
                        count: '${value.toInt()} Detected',
                        color: diseaseColor.withOpacity(
                          selectedDisease == null || selectedDisease == disease
                              ? 1
                              : 0.3,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ChartLegend(
              title: "Monthly Total",
              count: '${totalDiseasesForMonth.toInt()} Detected',
            ),
            const SizedBox(width: 16),
            ChartLegend(
              title: "All-Time Total",
              count: '${totalDiseases.toInt()} Detected Disease',
            ),
          ],
        ),
      ],
    );
  }
}
