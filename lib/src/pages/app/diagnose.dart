import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:aegistree/src/core/providers/solution_provider.dart';
import 'package:aegistree/src/src.dart';

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
  late String id;
  late double accuracy;
  bool isLoading = false;

  Future<void> getDetection() async {
    final url = Uri.https('aegistree.laurencetroyv.dev', '/predict');
    final image = base64Encode(bytes);
    final body = jsonEncode({"image": image});
    final headers = {'Content-Type': 'application/json'};

    final request = await http.post(url, body: body, headers: headers);

    if (request.statusCode == 200) {
      final body = json.decode(request.body);

      setState(() {
        id = body['disease_id'];
        diseaseName = body['disease_name'];
        accuracy = body['confidence'];
        detectionDone = true;
      });

      final disease = await ref
          .read(diseaseProvider.notifier)
          .addDisease(id, diseaseName, "Something Description", bytes);

      ref.read(leafsProvider.notifier).addLeaf(disease.id, bytes, accuracy);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to detect disease. Please try again."),
        ),
      );
    }
  }

  Future<void> getCamera() async {
    final response = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const CameraScreen();
        },
      ),
    );

    if (response != null) {
      bytes = response;
      setState(() {
        isAsset = false;
      });
    }
  }

  Future<void> getGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      bytes = await file.readAsBytes();
      setState(() {
        isAsset = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        GoogleFonts.inter().copyWith(fontWeight: FontWeight.w600),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isAsset) const SizedBox(width: double.infinity),
        const Inter(
          "Upload image to detect disease",
          fontSize: 20,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
        ),
        if (isAsset) const Gap(64) else const Gap(32),
        if (!isAsset)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(
                onPressed: () async => await getCamera(),
                style: style,
                child: const Text("START CAMERA"),
              ),
              FilledButton(
                onPressed: () async => await getGallery(),
                style: style,
                child: const Text("SELECT PHOTO"),
              ),
            ],
          ),
        if (!isAsset) const Gap(24),
        if (isAsset)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/dotted-border.png'),
              ),
            ),
            child: const Icon(Icons.camera, size: 200),
          )
        else
          Expanded(child: Image.memory(bytes)),
        if (isAsset) const Gap(64) else const Gap(16),
        if (!isAsset)
          SizedBox(
            width: 300,
            child: FilledButton(
              onPressed: () async {
                try {
                  setState(() => isLoading = true);
                  await getDetection();
                } catch (e) {
                  print('Server error: ${e.toString()}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Something went wrong, Please try again."),
                    ),
                  );
                } finally {
                  setState(() => isLoading = false);
                }
              },
              style: style,
              child:
                  isLoading
                      ? const CircularProgressIndicator(
                        color: Color(0xFF4285F4),
                      )
                      : const Text("DETECT"),
            ),
          ),
        if (detectionDone) const Gap(8),
        if (detectionDone)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Inter("Type of Disease: "),
              Inter(
                '$diseaseName - ${accuracy.round().toString()}%',
                color: const Color(0xFFEA592C),
              ),
            ],
          ),
        if (!isAsset) const Gap(24),
        if (isAsset)
          SizedBox(
            width: 200,
            child: FilledButton(
              onPressed: () async => await getCamera(),
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
                    final solutions = ref
                        .read(solutionProvider.notifier)
                        .getSolution(id);
                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Inter(
                              "${solutions?.name ?? diseaseName} Solution",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                            const Gap(6),
                            if (solutions == null)
                              const Column(
                                children: [
                                  SolutionBullet(
                                    "Rake up and destroy fallen leaves before the first snowfall to eliminate locations where diseases can survive to re-infect the plant the following growing season.",
                                  ),
                                  Gap(6),
                                  SolutionBullet(
                                    "Do not overcrowd plants — use size at maturity as a spacing guide when planting.",
                                  ),
                                  SolutionBullet(
                                    "Prune trees or shrubs to increase light penetration and improve air circulation throughout the canopy.",
                                  ),
                                  SolutionBullet(
                                    "Wet conditions promote disease, so water trees at the base and be careful not to splash water on leaves. A drip or soaker hose works best for this. Avoid sprinklers.",
                                  ),
                                ],
                              )
                            else
                              SingleChildScrollView(
                                child: SolutionBullet(solutions.solution),
                              ),
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
              onPressed: () async => await getGallery(),
              style: style,
              child: const Text("SELECT PHOTO"),
            ),
          ) /*  */
        else
          SizedBox(
            width: 200,
            child: FilledButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    final solutions = ref
                        .read(solutionProvider.notifier)
                        .getSolution(id);

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
                            if (solutions == null)
                              const Column(
                                children: [
                                  SolutionBullet(
                                    "Leaf spot diseases weaken trees and shrubs by interrupting photosynthesis.",
                                  ),
                                  Gap(6),
                                  SolutionBullet(
                                    "Most leaf spot diseases affect only a small percentage of the tree's overall leaf area, and are a minor stress on the health of the tree.",
                                  ),
                                  SolutionBullet(
                                    "Leaf spot diseases should be taken seriously if they result in moderate to complete leaf loss two to four years in a row.",
                                  ),
                                  SolutionBullet(
                                    "Leaf loss during several consecutive growing seasons can result in reduced growth and increased susceptibility to pests and other diseases.",
                                  ),
                                ],
                              )
                            else
                              SingleChildScrollView(
                                child: SolutionBullet(solutions.learnMore),
                              ),
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
    );

    return Scaffold(
      backgroundColor: white,
      appBar: const CustomImageAppBar(hasBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isAsset ? SingleChildScrollView(child: content) : content,
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
