import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'package:aegistree/src/components/index.dart';
import 'package:aegistree/src/functions/detection.dart';
import 'package:aegistree/src/providers/diseases_provider.dart';
import 'package:aegistree/src/providers/leafs_provider.dart';

import 'camera_screen.dart';

class Diagnose extends ConsumerStatefulWidget {
  const Diagnose({super.key});

  @override
  ConsumerState<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends ConsumerState<Diagnose> {
  bool isAsset = true;
  late Uint8List bytes;
  bool detectionDone = false;
  late String diseaseName;

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
      appBar: const CustomImageAppBar(hasBackButton: false),
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
                      onPressed: () async {
                        final response = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const CameraScreen();
                          }),
                        );

                        if (response != null) {
                          bytes = response as Uint8List;
                          setState(() {
                            isAsset = false;
                          });
                        }
                      },
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
                    final interpreter = await Interpreter.fromAsset(
                      "assets/models/1.tflite",
                      options: InterpreterOptions()..threads = 4,
                    );

                    final detection =
                        LeafDetectionService(interpreter: interpreter);

                    final response = await detection.detectLeaf(bytes);
                    final first = response.entries.first;

                    setState(() {
                      diseaseName = first.key.replaceAll("_", " ");
                      detectionDone = true;
                    });

                    final disease = ref
                        .read(diseaseProvider.notifier)
                        .addDisease(
                            diseaseName, "Something Description", bytes);

                    ref.read(leafsProvider.notifier).addLeaf(disease.id, bytes);
                  },
                  style: style,
                  child: const Text("DETECT"),
                ),
              ),
            if (detectionDone) const Gap(8),
            if (detectionDone)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Inter("Type of Disease: "),
                  Inter(
                    diseaseName,
                    color: const Color(0xFFEA592C),
                  ),
                ],
              ),
            if (!isAsset) const Gap(24),
            if (isAsset)
              SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: () async {
                    final response = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const CameraScreen();
                      }),
                    );

                    if (response != null) {
                      bytes = response as Uint8List;
                      setState(() {
                        isAsset = false;
                      });
                    }
                  },
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
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Inter(
                                  "$diseaseName Solution",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                                const Gap(6),
                                const SolutionBullet(
                                    "Rake up and destroy fallen leaves before the first snowfall to eliminate locations where diseases can survive to re-infect the plant the following growing season."),
                                const Gap(6),
                                const SolutionBullet(
                                    "Do not overcrowd plants — use size at maturity as a spacing guide when planting."),
                                const SolutionBullet(
                                    "Prune trees or shrubs to increase light penetration and improve air circulation throughout the canopy."),
                                const SolutionBullet(
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
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Inter(
                                  "Learn more about $diseaseName!",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                ),
                                const Gap(6),
                                const SolutionBullet(
                                    "Leaf spot diseases weaken trees and shrubs by interrupting photosynthesis."),
                                const Gap(6),
                                const SolutionBullet(
                                    "Most leaf spot diseases affect only a small percentage of the tree's overall leaf area, and are a minor stress on the health of the tree."),
                                const SolutionBullet(
                                    "Leaf spot diseases should be taken seriously if they result in moderate to complete leaf loss two to four years in a row."),
                                const SolutionBullet(
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
