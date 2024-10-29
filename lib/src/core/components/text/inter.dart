import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Inter extends ConsumerWidget {
  const Inter(
    this.text, {
    super.key,
    this.color,
    this.shadow,
    this.textAlign,
    this.fontWeight,
    this.fontSize = 16,
  });
  final String text;
  final double fontSize;
  final Color? color;
  final List<Shadow>? shadow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        shadows: shadow,
        fontWeight: fontWeight,
      ),
    );
  }
}
