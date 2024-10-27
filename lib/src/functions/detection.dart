import 'dart:math' as math;

import 'package:flutter/services.dart';

import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class LeafDetectionService {
  final Interpreter interpreter;
  final labels = [
    "Apple_scab",
    "Apple_black_rot",
    "Apple_cedar_apple_rust",
    "Apple_healthy",
    "Background_without_leaves",
    "Blueberry_healthy",
    "Cherry_powdery_mildew",
    "Cherry_healthy",
    "Corn_gray_leaf_spot",
    "Corn_common_rust",
    "Corn_northern_leaf_blight",
    "Corn_healthy",
    "Grape_black_rot",
    "Grape_black_measles",
    "Grape_leaf_blight",
    "Grape_healthy",
    "Orange_haunglongbing",
    "Peach_bacterial_spot",
    "Peach_healthy",
    "Pepper_bacterial_spot",
    "Pepper_healthy",
    "Potato_early_blight",
    "Potato_healthy",
    "Potato_late_blight",
    "Raspberry_healthy",
    "Soybean_healthy",
    "Squash_powdery_mildew",
    "Strawberry_healthy",
    "Strawberry_leaf_scorch",
    "Tomato_bacterial_spot",
    "Tomato_early_blight",
    "Tomato_healthy",
    "Tomato_late_blight",
    "Tomato_leaf_mold",
    "Tomato_septoria_leaf_spot",
    "Tomato_spider_mites_two-spotted_spider_mite",
    "Tomato_target_spot",
    "Tomato_mosaic_virus",
  ];

  LeafDetectionService({required this.interpreter});

  Future<Map<String, double>> detectLeaf(Uint8List bytes) async {
    // Load and preprocess the image
    final image = img.decodeImage(bytes)!;
    final resizedImage = img.copyResize(image, width: 224, height: 224);

    // Convert image to float32 array and normalize
    var input = List.generate(
      1, // batch size
      (_) => List.generate(
        224, // height
        (y) => List.generate(
          224, // width
          (x) => List.generate(
            3, // channels (RGB)
            (c) {
              final pixel = resizedImage.getPixel(x, y);
              // Get RGB values
              return c == 0
                  ? pixel.r / 255.0
                  : c == 1
                      ? pixel.g / 255.0
                      : pixel.b / 255.0;
            },
          ),
        ),
      ),
    );

    // Prepare output tensor
    var output =
        List.filled(1 * 38, 0.0).reshape([1, 38]); // 38 classes as per model

    // Run inference
    interpreter.run(input, output);

    // Process results
    // Apply softmax to get probabilities
    final List<double> probabilities = _softmax(output[0]);

    final confidence = probabilities.map((prob) {
      return prob * 100;
    }).toList();

    // Create map of label to probability
    final results = Map.fromIterables(
      labels,
      confidence,
    );

    // Sort by probability in descending order
    final sortedResults = Map.fromEntries(
        results.entries.toList()..sort((a, b) => b.value.compareTo(a.value)));

    return sortedResults;
  }

  // Helper function to compute softmax
  List<double> _softmax(List<double> values) {
    double max = values.reduce((curr, next) => curr > next ? curr : next);
    List<double> exp = values.map((val) => math.exp(val - max)).toList();
    double sum = exp.reduce((curr, next) => curr + next);
    return exp.map((val) => val / sum).toList();
  }
}
