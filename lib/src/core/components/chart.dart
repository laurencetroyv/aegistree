import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/src.dart';

class DiseaseDetectionChart extends ConsumerStatefulWidget {
  const DiseaseDetectionChart({super.key});

  @override
  ConsumerState<DiseaseDetectionChart> createState() =>
      _DiseaseDetectionChartState();
}

class _DiseaseDetectionChartState extends ConsumerState<DiseaseDetectionChart> {
  String? selectedDisease;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(chartProvider);

    // Group data by month
    final monthlyData = <String, Map<String, double>>{};
    for (var item in data) {
      monthlyData.putIfAbsent(item.month, () => {});
      monthlyData[item.month]![item.name] = item.value;
    }

    // Get unique disease names
    final diseases = data.map((e) => e.name).toSet().toList();

    // Calculate total diseases
    final totalDiseases = data.fold<double>(0, (sum, item) => sum + item.value);

    if (data.isEmpty) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 187, 233, 170),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.insert_chart_outlined,
                size: 48,
                color: Color(0xFF48BD1F),
              ),
              SizedBox(height: 16),
              InknutAntiqua(
                "No disease trends available yet",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Karla(
                "Add some leaves or filter to see disease trends over time",
                textAlign: TextAlign.center,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: data.isEmpty
                  ? 100
                  : data.map((e) => e.value).reduce((a, b) => a > b ? a : b) *
                      1.2,
              barGroups: monthlyData.entries.map((entry) {
                final month = entry.key;
                final monthData = entry.value;

                return BarChartGroupData(
                  x: monthlyData.keys.toList().indexOf(month),
                  barRods: diseases.map((disease) {
                    final value = monthData[disease] ?? 0;
                    final color =
                        data.firstWhere((d) => d.name == disease).color;

                    return BarChartRodData(
                      toY: value,
                      color: color.withOpacity(
                          selectedDisease == null || selectedDisease == disease
                              ? 1
                              : 0.3),
                      width: 25,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(4)),
                    );
                  }).toList(),
                );
              }).toList(),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Month',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= 0 &&
                          value.toInt() < monthlyData.length) {
                        return Text(monthlyData.keys.elementAt(value.toInt()));
                      }
                      return const Text('');
                    },
                    reservedSize: 25,
                  ),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: const Text(
                    'Number of Diseases',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(value.toInt().toString());
                    },
                    reservedSize: 35,
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
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: diseases.map((disease) {
              final diseaseData = data.where((d) => d.name == disease);
              final total =
                  diseaseData.fold<double>(0, (sum, item) => sum + item.value);

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
                    count: '${total.toInt()} Detected',
                    color: data
                        .firstWhere((d) => d.name == disease)
                        .color
                        .withOpacity(selectedDisease == null ||
                                selectedDisease == disease
                            ? 1
                            : 0.3),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        ChartLegend(
          title: "Total",
          count: '${totalDiseases.toInt()} Detected Disease',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
