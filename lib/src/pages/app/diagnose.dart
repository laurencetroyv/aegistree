import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'package:aegistree/src/components/index.dart';

class Diagnose extends ConsumerStatefulWidget {
  const Diagnose({super.key});

  @override
  ConsumerState<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends ConsumerState<Diagnose> {
  bool isAsset = true;
  late Uint8List bytes;
  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        GoogleFonts.inter().copyWith(fontWeight: FontWeight.w600),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    return Scaffold(
      appBar: const CustomImageAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (isAsset) const SizedBox(width: double.infinity),
            const Inter(
              "Upload image to detect disease",
              fontSize: 20,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            if (isAsset) const Gap(96) else const Gap(32),
            if (!isAsset)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 175,
                    child: FilledButton(
                      onPressed: () {},
                      style: style,
                      child: const Text("START CAMERA"),
                    ),
                  ),
                  SizedBox(
                    width: 175,
                    child: FilledButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(type: FileType.image);

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          bytes = await file.readAsBytes();
                          setState(() {
                            isAsset = false;
                          });
                        }
                      },
                      style: style,
                      child: const Text("SELECT PHOTO"),
                    ),
                  )
                ],
              ),
            if (!isAsset) const Gap(24),
            if (isAsset)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/dotted-border.png')),
                ),
                child: const Icon(Icons.camera, size: 200),
              )
            else
              Expanded(child: Image.memory(bytes)),
            if (isAsset) const Gap(96) else const Gap(16),
            if (!isAsset)
              SizedBox(
                width: 300,
                child: FilledButton(
                  onPressed: () async {
                    final interpreter =
                        await Interpreter.fromAsset("assets/models/1.tflite");

                    print(interpreter);
                  },
                  style: style,
                  child: const Text("DETECT"),
                ),
              ),
            if (!isAsset) const Gap(32),
            if (isAsset)
              SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: () {},
                  style: style,
                  child: const Text("START CAMERA"),
                ),
              )
            else
              SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return const Dialog(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Inter(
                                  "Leaf Spot Solution",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                Gap(6),
                                SolutionBullet(
                                    "Rake up and destroy fallen leaves before the first snowfall to eliminate locations where diseases can survive to re-infect the plant the following growing season."),
                                Gap(6),
                                SolutionBullet(
                                    "Do not overcrowd plants — use size at maturity as a spacing guide when planting."),
                                SolutionBullet(
                                    "Prune trees or shrubs to increase light penetration and improve air circulation throughout the canopy."),
                                SolutionBullet(
                                    "Wet conditions promote disease, so water trees at the base and be careful not to splash water on leaves. A drip or soaker hose works best for this. Avoid sprinklers."),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: style,
                  child: const Text("SOLUTIONS"),
                ),
              ),
            if (isAsset)
              SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(type: FileType.image);

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      bytes = await file.readAsBytes();
                      setState(() {
                        isAsset = false;
                      });
                    }
                  },
                  style: style,
                  child: const Text("SELECT PHOTO"),
                ),
              )
            else
              SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return const Dialog(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Inter(
                                  "Learn more about Leaf Spot!",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                Gap(6),
                                SolutionBullet(
                                    "Leaf spot diseases weaken trees and shrubs by interrupting photosynthesis."),
                                Gap(6),
                                SolutionBullet(
                                    "Most leaf spot diseases affect only a small percentage of the tree's overall leaf area, and are a minor stress on the health of the tree."),
                                SolutionBullet(
                                    "Leaf spot diseases should be taken seriously if they result in moderate to complete leaf loss two to four years in a row."),
                                SolutionBullet(
                                    "Leaf loss during several consecutive growing seasons can result in reduced growth and increased susceptibility to pests and other diseases."),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: style,
                  child: const Text("LEARN MORE!"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SolutionBullet extends ConsumerWidget {
  const SolutionBullet(this.description, {super.key});
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
          TextSpan(text: description),
        ],
      ),
    );
  }
}
