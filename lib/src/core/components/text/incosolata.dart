import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Incosolata extends ConsumerWidget {
  const Incosolata(
    this.text, {
    super.key,
    this.size = 16,
    this.color,
    this.shadow,
    this.textAlign,
    this.fontWeight,
  });
  final String text;
  final double size;
  final Color? color;
  final List<Shadow>? shadow;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inconsolata(
        color: color,
        fontSize: size,
        shadows: shadow,
        fontWeight: fontWeight,
      ),
    );
  }
}
