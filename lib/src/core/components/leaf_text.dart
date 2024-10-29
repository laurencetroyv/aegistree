import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LeafText extends ConsumerWidget {
  const LeafText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Image.asset('assets/images/small-leaf.png'),
        Text(
          text,
          style: GoogleFonts.inknutAntiqua(
            textStyle: const TextStyle(
              color: Color(0xFF504F4F),
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
