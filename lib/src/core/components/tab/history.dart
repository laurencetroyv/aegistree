import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:aegistree/src/src.dart';

class HistoryTab extends ConsumerWidget {
  const HistoryTab(this.type, {super.key, required this.scrollController});

  final String type;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leafs = ref.watch(leafsProvider.notifier).getLeafsByDisease(type);

    // Group leaves by month and year
    final groupedLeafs = <String, List<LeafEntity>>{};

    for (var leaf in leafs) {
      final date = leaf.createdAt;
      final monthYear = DateFormat('MMMM yyyy').format(date);

      if (!groupedLeafs.containsKey(monthYear)) {
        groupedLeafs[monthYear] = [];
      }
      groupedLeafs[monthYear]!.add(leaf);
    }

    // Sort the groups by date (most recent first)
    final sortedMonths = groupedLeafs.keys.toList()
      ..sort((a, b) {
        final dateA = DateFormat('MMMM yyyy').parse(a);
        final dateB = DateFormat('MMMM yyyy').parse(b);
        return dateB.compareTo(dateA);
      });

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: sortedMonths.length,
      itemBuilder: (context, monthIndex) {
        final monthYear = sortedMonths[monthIndex];
        final monthLeafs = groupedLeafs[monthYear]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                monthYear,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: monthLeafs.length,
              itemBuilder: (context, index) {
                final leaf = monthLeafs[index];
                final id = leaf.id.split("-")[0];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeafDetails(
                          leaf,
                          collectionName: leaf.type,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: MemoryImage(leaf.image),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                id,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                DateFormat('MM/dd').format(leaf.createdAt),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Gap(16),
          ],
        );
      },
    );
  }
}
