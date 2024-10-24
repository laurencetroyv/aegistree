import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletText extends ConsumerWidget {
  const BulletText(this.title, {super.key, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.karla(fontSize: 16, color: Colors.black),
        children: [
          TextSpan(
            text: "• ",
            style: GoogleFonts.karla(fontSize: 16, color: Colors.black),
          ),
          TextSpan(
            text: title,
            style: GoogleFonts.karla(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(text: " - $description"),
        ],
      ),
    );
  }
}
