import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:aegistree/src/constants/index.dart';
import 'package:aegistree/src/pages/app.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              GoogleFonts.inknutAntiqua().copyWith(fontSize: kLarge),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              GoogleFonts.inknutAntiqua().copyWith(fontSize: kLarge),
            ),
          ),
        ),
      ),
      home: const App(),
    );
  }
}
