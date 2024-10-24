import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Koho extends ConsumerWidget {
  const Koho(
    this.text, {
    super.key,
    this.color,
    this.shadow,
    this.textAlign,
    this.fontWeight,
    this.size = 16,
  });
  final String text;
  final double size;
  final Color? color;
  final TextAlign? textAlign;
  final List<Shadow>? shadow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.koHo(
        color: color,
        fontSize: size,
        shadows: shadow,
        fontWeight: fontWeight,
      ),
    );
  }
}