import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Imprima extends ConsumerWidget {
  const Imprima(
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
  final List<Shadow>? shadow;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.imprima(
        color: color,
        fontSize: size,
        shadows: shadow,
        fontWeight: fontWeight,
      ),
    );
  }
}
