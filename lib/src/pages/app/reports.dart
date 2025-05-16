import 'package:flutter/material.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:aegistree/src/core/components/empty_chart.dart';
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
  final exportDelegate = ExportDelegate(
    options: const ExportOptions(pageFormatOptions: PageFormatOptions.a4()),
  );

  // Add sorting state variables
  int _sortColumnIndex = 1; // Default sort by date (uploaded)
  bool _sortAscending = false; // Default sort by most recent first

  // Disease filtering
  Set<String> _selectedDiseases = {}; // Empty means show all

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
    final today =
        fromDate.year == now.year &&
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
      for (
        var date = fromDate;
        date.isBefore(toDate.add(const Duration(days: 1)));
        date = date.add(const Duration(days: 1))
      ) {
        final dateStr = DateFormat('yyyy-MM-dd').format(date);
        final count = leafsByDate[dateStr]?.length ?? 0;

        diseaseSpots[album.title]!.add(
          FlSpot(date.difference(fromDate).inDays.toDouble(), count.toDouble()),
        );
      }
    }

    // Create a flat list of all leaves for sorting
    final allLeaves = <Map<String, dynamic>>[];
    for (var album in albums) {
      // Skip if this disease is filtered out
      if (_selectedDiseases.isNotEmpty &&
          !_selectedDiseases.contains(album.title)) {
        continue;
      }

      for (var leaf in album.leafs) {
        if (leaf.createdAt.isAfter(fromDate) &&
            leaf.createdAt.isBefore(toDate.add(const Duration(days: 1)))) {
          allLeaves.add({
            'id': leaf.uid,
            'date': leaf.createdAt,
            'dateStr': DateFormat('MM/dd/yy').format(leaf.createdAt),
            'disease': album.title,
            'severity': leaf.accuracy.roundToDouble(),
            'leaf': leaf,
            'album': album,
          });
        }
      }
    }

    // Sort the leaves based on the current sort column and direction
    _sortLeaves(allLeaves);

    return Scaffold(
      appBar: AppBar(title: const Text("Report")),
      body: ExportFrame(
        exportDelegate: exportDelegate,
        frameId: 'export_graph',
        child: SingleChildScrollView(
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
                          final from = DateFormat(
                            'MMM d, yyyy',
                          ).format(value[0]!);
                          final to = DateFormat(
                            'MMM d, yyyy',
                          ).format(value[1]!);
                          setState(() {
                            dates = value;
                            filteredText = "$from - $to";
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
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
                  AspectRatio(aspectRatio: 1.70, child: EmptyChart())
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
                                  final date = fromDate.add(
                                    Duration(days: value.toInt()),
                                  );
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
                              fromDate
                                  .difference(toDate)
                                  .inDays
                                  .abs()
                                  .toDouble(),
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
                    // Add an "All" option for legend
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedDiseases.clear();
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              border: Border.all(
                                color:
                                    _selectedDiseases.isEmpty
                                        ? Colors.black
                                        : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          const Gap(4),
                          Text(
                            "All Diseases",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight:
                                  _selectedDiseases.isEmpty
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (var i = 0; i < diseaseSpots.length; i++)
                      _buildLegendItem(diseaseSpots.keys.elementAt(i), i),
                  ],
                ),
                const Gap(24),
                const Text(
                  'List of Detected Diseases',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Gap(8),
                // Disease List Table
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Date Range:',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
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
                        try {
                          exportDelegate.getFrame('export_graph');
                        } catch (error) {
                          print(error.toString());
                        }
                      },
                    ),
                  ],
                ),
                const Gap(16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(
                      Colors.green.shade800,
                    ),
                    headingTextStyle: const TextStyle(color: Colors.white),
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    columns: [
                      DataColumn(
                        label: const Text('ID'),
                        onSort: (columnIndex, ascending) {
                          _onSort(columnIndex, ascending);
                        },
                      ),
                      DataColumn(
                        label: const Text('Uploaded'),
                        onSort: (columnIndex, ascending) {
                          _onSort(columnIndex, ascending);
                        },
                      ),
                      DataColumn(
                        label: const Text('Disease'),
                        onSort: (columnIndex, ascending) {
                          _onSort(columnIndex, ascending);
                        },
                      ),
                      DataColumn(
                        label: const Text('Severity'),
                        numeric: true, // This helps for sorting numeric values
                        onSort: (columnIndex, ascending) {
                          _onSort(columnIndex, ascending);
                        },
                      ),
                    ],
                    rows:
                        allLeaves.map((item) {
                          return DataRow(
                            cells: [
                              DataCell(Text(item['id'])),
                              DataCell(Text(item['dateStr'])),
                              DataCell(Text(item['disease'])),
                              DataCell(Text('${item['severity']}%')),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  void _sortLeaves(List<Map<String, dynamic>> leaves) {
    switch (_sortColumnIndex) {
      case 0: // ID
        leaves.sort((a, b) {
          final result = a['id'].compareTo(b['id']);
          return _sortAscending ? result : -result;
        });
        break;
      case 1: // Date (default)
        leaves.sort((a, b) {
          final result = a['date'].compareTo(b['date']);
          return _sortAscending ? result : -result;
        });
        break;
      case 2: // Disease
        leaves.sort((a, b) {
          final result = a['disease'].compareTo(b['disease']);
          return _sortAscending ? result : -result;
        });
        break;
      case 3: // Severity
        leaves.sort((a, b) {
          final result = a['severity'].compareTo(b['severity']);
          return _sortAscending ? result : -result;
        });
        break;
    }
  }

  Widget _buildLegendItem(String label, int index) {
    final isSelected = _selectedDiseases.contains(label);

    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedDiseases.remove(label);
          } else {
            _selectedDiseases = {label}; // Only show this disease
          }
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: getColor(index),
              border: Border.all(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
