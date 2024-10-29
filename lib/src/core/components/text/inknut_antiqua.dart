import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InknutAntiqua extends ConsumerWidget {
  const InknutAntiqua(
    this.text, {
    super.key,
    this.color,
    this.shadow,
    this.textAlign,
    this.fontWeight,
    this.fontSize = 16,
  });
  final String text;
  final Color? color;
  final double fontSize;
  final List<Shadow>? shadow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inknutAntiqua(
        color: color,
        shadows: shadow,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
