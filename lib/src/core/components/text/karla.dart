import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Karla extends ConsumerWidget {
  const Karla(
    this.text, {
    super.key,
    this.color,
    this.shadow,
    this.textAlign,
    this.fontWeight,
    this.decoration,
    this.fontSize = 16,
  });
  final String text;
  final Color? color;
  final double fontSize;
  final List<Shadow>? shadow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.karla(
        color: color,
        shadows: shadow,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
