import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberText extends ConsumerWidget {
  const NumberText(this.text, {super.key, required this.number});
  final String number;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const color = Color(0xFF185105);
    return RichText(
      text: TextSpan(
        style: GoogleFonts.koHo(fontSize: 16, color: color),
        children: [
          TextSpan(
            text: "$number. ",
            style: GoogleFonts.koHo(fontSize: 16, color: color),
          ),
          TextSpan(text: text),
        ],
      ),
    );
  }
}
