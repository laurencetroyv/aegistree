import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/src.dart';

class EmptyChart extends ConsumerWidget {
  const EmptyChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
