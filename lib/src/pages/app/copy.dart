import 'package:flutter/material.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:aegistree/src/core/core.dart';

class Reports extends ConsumerStatefulWidget {
  const Reports({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportsState();
}

class _ReportsState extends ConsumerState<Reports> {
  final controller = ScrollController();
  List<DateTime?> dates = [DateTime.now(), DateTime.now()];
  String filteredText = DateFormat('MMM d, yyyy').format(DateTime.now());

  final colors = [
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

  Color getColor(int index) {
    if (index >= colors.length) {
      return HSLColor.fromAHSL(
        1.0,
        (index * 137.508) % 360,
        0.7,
        0.5,
      ).toColor();
    }
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    final albums = ref.watch(albumProvider);
    final fromDate = dates[0]!;
    final toDate = dates[1]!;
    final now = DateTime.now();
    final today = fromDate.year == now.year &&
        fromDate.month == now.month &&
        fromDate.day == now.day &&
        toDate.year == now.year &&
        toDate.month == now.month &&
        toDate.day == now.day;

    final Map<String, List<FlSpot>> diseaseSpots = {};

    // Process data for each disease album
    for (var album in albums) {
      diseaseSpots[album.title] = [];

      // Group leaves by date
      final Map<String, List<LeafEntity>> leafsByDate = {};
      for (var leaf in album.leafs) {
        if (leaf.createdAt.isAfter(fromDate) &&
            leaf.createdAt.isBefore(toDate)) {
          final dateStr = DateFormat('yyyy-MM-dd').format(leaf.createdAt);
          leafsByDate[dateStr] = [...(leafsByDate[dateStr] ?? []), leaf];
        }
      }

      // Create spots for the line chart
      for (var date = fromDate;
          date.isBefore(toDate.add(const Duration(days: 1)));
          date = date.add(const Duration(days: 1))) {
        final dateStr = DateFormat('yyyy-MM-dd').format(date);
        final count = leafsByDate[dateStr]?.length ?? 0;

        diseaseSpots[album.title]!.add(FlSpot(
          date.difference(fromDate).inDays.toDouble(),
          count.toDouble(),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
      ),
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      final value = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(
                          calendarType: CalendarDatePicker2Type.range,
                        ),
                        dialogSize: const Size(double.infinity, 400),
                        value: dates,
                        borderRadius: BorderRadius.circular(15),
                      );

                      if (value != null) {
                        final from =
                            DateFormat('MMM d, yyyy').format(value[0]!);
                        final to = DateFormat('MMM d, yyyy').format(value[1]!);
                        setState(() {
                          dates = value;
                          filteredText = "$from - $to";
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Date Range:',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(filteredText),
                  ),
                ],
              ),
              const Gap(24),

              // Line Chart
              if (albums.isEmpty || today)
                AspectRatio(
                  aspectRatio: 1.70,
                  child: Container(
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
                  ),
                )
              else
                AspectRatio(
                  aspectRatio: 1.70,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          drawHorizontalLine: true,
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                final date =
                                    fromDate.add(Duration(days: value.toInt()));
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    DateFormat('MM/dd').format(date),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.black12),
                        ),
                        minX: 0,
                        maxX:
                            fromDate.difference(toDate).inDays.abs().toDouble(),
                        lineBarsData: [
                          for (var i = 0; i < diseaseSpots.length; i++)
                            LineChartBarData(
                              spots: diseaseSpots.values.elementAt(i),
                              isCurved: true,
                              color: getColor(i),
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

              const Gap(24),

              // Legend
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < diseaseSpots.length; i++)
                    _buildLegendItem(diseaseSpots.keys.elementAt(i), i)
                ],
              ),
              const Gap(24),
              const Text(
                'List of Detected Diseases',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(8),
              // Disease List Table
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Date Range:',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const Gap(8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          filteredText,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.import_export),
                        onPressed: () async {
                          // Export this whole page to PDF
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(16),

              // Table
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor:
                      WidgetStateProperty.all(Colors.green.shade800),
                  headingTextStyle: const TextStyle(color: Colors.white),
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Uploaded')),
                    DataColumn(label: Text('Disease')),
                    DataColumn(label: Text('Severity')),
                  ],
                  rows: [
                    for (var album in albums)
                      ...album.leafs
                          .where((leaf) =>
                              leaf.createdAt.isAfter(fromDate) &&
                              leaf.createdAt.isBefore(
                                  toDate.add(const Duration(days: 1))))
                          .map(
                            (leaf) => DataRow(
                              cells: [
                                DataCell(Text(leaf.uid)),
                                DataCell(Text(DateFormat('MM/dd/yy')
                                    .format(leaf.createdAt))),
                                DataCell(Text(album.title)),
                                // You can implement severity logic here
                                DataCell(
                                    Text('${leaf.accuracy.roundToDouble()}%')),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          color: getColor(index),
        ),
        const Gap(4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
