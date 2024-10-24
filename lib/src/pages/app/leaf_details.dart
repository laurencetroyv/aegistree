import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:aegistree/src/components/index.dart';
import 'package:aegistree/src/entities/entities.dart';

class LeafDetails extends StatelessWidget {
  const LeafDetails(
    this.leaf, {
    super.key,
    required this.collectionName,
  });

  final LeafEntity leaf;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Image.network(
                  leaf.path,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const Expanded(flex: 6, child: SizedBox()),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 8,
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.6,
            maxChildSize: 0.9,
            initialChildSize: 0.6,
            builder: (context, scrollController) {
              final createdAt = DateFormat('MM/dd/yy').format(leaf.createdAt);

              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.38, 1.0],
                      colors: [
                        Color(0xFFC5FBB3),
                        Color(0x00C5FBB3),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Imprima(collectionName, color: Colors.black54),
                                Row(
                                  children: [
                                    const Imprima('Date:',
                                        color: Colors.black54),
                                    const Gap(4),
                                    Imprima(
                                      createdAt,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            InknutAntiqua(
                              leaf.uid,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),

                      // Tab Bar
                      DefaultTabController(
                        length: 3,
                        child: Expanded(
                          child: Column(
                            children: [
                              const TabBar(
                                tabs: [
                                  Tab(text: 'ACTION'),
                                  Tab(text: 'REQUIREMENTS'),
                                  Tab(text: 'HISTORY'),
                                ],
                                labelColor: Colors.black87,
                                unselectedLabelColor: Colors.black54,
                                indicatorColor: Colors.green,
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    ActionTab(
                                      scrollController,
                                      image: leaf.path,
                                    ),
                                    RequirementTab(
                                      scrollController,
                                      image: leaf.path,
                                    ),
                                    const Center(
                                        child: Text('History Content')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
