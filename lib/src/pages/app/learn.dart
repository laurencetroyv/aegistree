import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:aegistree/src/pages/app/detailed_diseases.dart';
import 'package:aegistree/src/src.dart';

class Learn extends ConsumerWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultShadow = BoxShadow(
      color: Colors.black.withOpacity(.25),
      blurRadius: 4,
      offset: const Offset(0, 4),
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: black60,
                    )
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Koho(
                            "Discover how to identify and treat these diseases to keep your trees thriving!",
                            fontWeight: FontWeight.w600,
                            color: black60,
                          ),
                        ),
                        Transform.flip(
                          flipX: true,
                          child: SizedBox(
                            width: 100,
                            child: Image.asset(
                              'assets/images/plant-hand.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(32),
              InknutAntiqua(
                "Types of Leaf Diseases",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                shadow: [defaultShadow],
              ),
              const Gap(16),
              FutureBuilder(
                future: fetchDiseases(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final diseases = snapshot.data as List<LearnEntity>;
                    return Expanded(
                      child: GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: diseases.length,
                        itemBuilder: (context, index) {
                          final disease = diseases[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailedDiseases(disease);
                                }),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFFFE9),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [defaultShadow],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 22,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Image.memory(
                                            disease.disease.image)),
                                    const Gap(12),
                                    Koho(
                                      disease.disease.name,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF247408),
                                      textAlign: TextAlign.center,
                                      shadow: [defaultShadow],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<LearnEntity>> fetchDiseases() async {
    final diseaseTypes = [
      "Anthracnose",
      "Black spot",
      "Blight",
      "Canker",
      "Downy mildew",
      "Powdery mildew",
      "Rust",
      "Shot hole",
      "Leaf spot",
      "Sooty mold",
    ];

    final anthracnose = await File('assets/images/diseases/').readAsBytes();
    final blackSpot = await File('assets/images/diseases/').readAsBytes();
    final blight = await File('assets/images/diseases/').readAsBytes();
    final canker = await File('assets/images/diseases/').readAsBytes();
    final downyMildew = await File('assets/images/diseases/').readAsBytes();
    final powderyMildew = await File('assets/images/diseases/').readAsBytes();
    final rust = await File('assets/images/diseases/').readAsBytes();
    final shotHole = await File('assets/images/diseases/').readAsBytes();
    final leafSpot = await File('assets/images/diseases/').readAsBytes();
    final sootyMold = await File('assets/images/diseases/').readAsBytes();

    final learn = [
      LearnEntity(
        disease: DiseaseEntity(
          id: "0",
          name: diseaseTypes[0],
          description: "This is a description of ${diseaseTypes[0]}",
          image: anthracnose,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "1",
          name: diseaseTypes[1],
          description: "This is a description of ${diseaseTypes[1]}",
          image: blackSpot,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "2",
          name: diseaseTypes[2],
          description: "This is a description of ${diseaseTypes[2]}",
          image: blight,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "3",
          name: diseaseTypes[3],
          description: "This is a description of ${diseaseTypes[3]}",
          image: canker,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "4",
          name: diseaseTypes[4],
          description: "This is a description of ${diseaseTypes[4]}",
          image: downyMildew,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "5",
          name: diseaseTypes[5],
          description: "This is a description of ${diseaseTypes[5]}",
          image: powderyMildew,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "6",
          name: diseaseTypes[6],
          description: "This is a description of ${diseaseTypes[6]}",
          image: rust,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "7",
          name: diseaseTypes[7],
          description: "This is a description of ${diseaseTypes[7]}",
          image: shotHole,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "8",
          name: diseaseTypes[8],
          description: "This is a description of ${diseaseTypes[8]}",
          image: leafSpot,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "9",
          name: diseaseTypes[9],
          description: "This is a description of ${diseaseTypes[9]}",
          image: sootyMold,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
    ];

    return learn;
  }
}
