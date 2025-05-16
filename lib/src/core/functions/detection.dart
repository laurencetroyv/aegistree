// import 'dart:math' as math;

// import 'package:flutter/services.dart';

// import 'package:image/image.dart' as img;
// import 'package:tflite_flutter/tflite_flutter.dart';

// class LeafDetectionService {
//   final Interpreter interpreter;
//   final labels = [
//     {"id": "25909366-0017-40d2-af3a-8995791759c3", "disease": "Scab"},
//     {"id": "534ba6ab-36f1-4b18-93f0-715fd0ea2903", "disease": "Black_Rot"},
//     {"id": "3d84a4ec-9edd-4979-a727-6e451d95f56c", "disease": "Rust"},
//     {"id": "53926576-de24-4d9a-8446-1549f4f30891", "disease": "Healthy"},
//     {
//       "id": "1909677b-fa28-4968-bcf8-5543694899d5",
//       "disease": "Background_without_leaves",
//     },
//     {"id": "2540e0d9-dc18-425f-a456-16f22255cb17", "disease": "Healthy"},
//     {"id": "450ce5c9-8be4-4e44-a037-b2ab6072fd72", "disease": "Powdery_Mildew"},
//     {"id": "b4326644-7afa-45c4-9de5-8b031d5742ea", "disease": "Healthy"},
//     {"id": "fbe26023-5fb9-4478-b73d-d562a57c843d", "disease": "Leaf_Spot"},
//     {"id": "3d84a4ec-9edd-4979-a727-6e451d95f56c", "disease": "Common_Rust"},
//     {"id": "3edbc092-e4d2-4547-b2c8-a9871a13b620", "disease": "Leaf_Blight"},
//     {"id": "b29c962d-617c-4acb-bda7-b691127be06a", "disease": "Healthy"},
//     {"id": "534ba6ab-36f1-4b18-93f0-715fd0ea2903", "disease": "Black_Rot"},
//     {"id": "7582e024-4e7c-437b-b8f5-9fe76a7da85f", "disease": "Black_Measles"},
//     {"id": "3edbc092-e4d2-4547-b2c8-a9871a13b620", "disease": "Leaf_Blight"},
//     {"id": "ca20c6eb-724f-4deb-8b72-9748e20d7b02", "disease": "Healthy"},
//     {"id": "49a9f540-53c1-482e-940d-aa712196884b", "disease": "Haunglongbing"},
//     {"id": "c8cffdb6-33a2-4151-9172-c2cbc4063f85", "disease": "Bacterial_Spot"},
//     {"id": "8d5c7193-1f6e-45ef-966f-0aa638d069f1", "disease": "Healthy"},
//     {"id": "c8cffdb6-33a2-4151-9172-c2cbc4063f85", "disease": "Bacterial_Spot"},
//     {"id": "6827ec33-0a91-4b07-b32c-eeb35421fff7", "disease": "Healthy"},
//     {"id": "3111e46e-0314-4b93-ba0d-a54a81e8641d", "disease": "Early_Blight"},
//     {"id": "52706002-2039-4967-8f7d-04eabf3528fd", "disease": "Healthy"},
//     {"id": "b3671f55-bde0-4aca-bc15-5c2d90bf2f81", "disease": "Late_Blight"},
//     {"id": "53b50938-798e-413d-b204-03b75487b7ba", "disease": "Healthy"},
//     {"id": "65485654-e04a-496d-8ee2-3b8b6d430ed1", "disease": "Healthy"},
//     {"id": "450ce5c9-8be4-4e44-a037-b2ab6072fd72", "disease": "Powdery_Mildew"},
//     {"id": "c3c82c63-c176-40f1-8498-03a5a31ed47f", "disease": "Healthy"},
//     {"id": "98b9477d-a0ce-4d35-bc23-889fe938f6b2", "disease": "Leaf_Scorch"},
//     {"id": "c8cffdb6-33a2-4151-9172-c2cbc4063f85", "disease": "Bacterial_Spot"},
//     {"id": "d23b9935-02a1-436e-b8f0-9a4faadbbcf2", "disease": "Early_Blight"},
//     {"id": "417f4f64-38b8-4958-a974-e33522a3ba8d", "disease": "Healthy"},
//     {"id": "b3671f55-bde0-4aca-bc15-5c2d90bf2f81", "disease": "Late_Blight"},
//     {"id": "0401b57e-50b1-4e67-8eea-4392ae95f4d4", "disease": "Leaf_Mold"},
//     {"id": "fbe26023-5fb9-4478-b73d-d562a57c843d", "disease": "Leaf_spot"},
//     {
//       "id": "cac158e1-a34d-4912-822e-3789e9dbc409",
//       "disease": "Spider_mites_two-spotted_spider_mite",
//     },
//     {"id": "938230a1-acb7-4b16-afae-36a6adc30a41", "disease": "Target_spot"},
//     {"id": "06a807b2-a25f-42fd-9829-9f79a9d702d1", "disease": "Mosaic_virus"},
//   ];

//   LeafDetectionService({required this.interpreter});

//   Future<Map<String, Map<String, dynamic>>> detectLeaf(Uint8List bytes) async {
//     // Load and preprocess the image
//     final image = img.decodeImage(bytes)!;
//     final resizedImage = img.copyResize(image, width: 224, height: 224);

//     // Convert image to float32 array and normalize
//     var input = List.generate(
//       1, // batch size
//       (_) => List.generate(
//         224, // height
//         (y) => List.generate(
//           224, // width
//           (x) => List.generate(
//             3, // channels (RGB)
//             (c) {
//               final pixel = resizedImage.getPixel(x, y);
//               // Get RGB values
//               return c == 0
//                   ? pixel.r / 255.0
//                   : c == 1
//                   ? pixel.g / 255.0
//                   : pixel.b / 255.0;
//             },
//           ),
//         ),
//       ),
//     );

//     // Prepare output tensor
//     var output = List.filled(
//       1 * 38,
//       0.0,
//     ).reshape([1, 38]); // 38 classes as per model

//     // Run inference
//     interpreter.run(input, output);

//     // Process results
//     // Apply softmax to get probabilities
//     final List<double> probabilities = _softmax(output[0]);

//     final confidence =
//         probabilities.map((prob) {
//           return prob * 100;
//         }).toList();

//     // Create initial results with all information
//     Map<String, Map<String, dynamic>> results = {};
//     for (var i = 0; i < labels.length; i++) {
//       final disease = labels[i]['disease'] as String;
//       results[disease] = {'id': labels[i]['id'], 'confidence': confidence[i]};
//     }

//     // Sort by confidence in descending order and create new map
//     final sortedResults = Map.fromEntries(
//       results.entries.toList()..sort(
//         (a, b) => b.value['confidence'].compareTo(a.value['confidence']),
//       ),
//     );

//     return sortedResults;
//   }

//   // Helper function to compute softmax
//   List<double> _softmax(List<double> values) {
//     double max = values.reduce((curr, next) => curr > next ? curr : next);
//     List<double> exp = values.map((val) => math.exp(val - max)).toList();
//     double sum = exp.reduce((curr, next) => curr + next);
//     return exp.map((val) => val / sum).toList();
//   }
// }
