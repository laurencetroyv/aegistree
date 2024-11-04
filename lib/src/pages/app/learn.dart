import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

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

    // Use Future.wait to handle multiple async operations
    final diseases = await Future.wait(
      diseaseTypes.map((type) async {
        final id = uuid.v4();
        final response =
            await http.get(Uri.parse("https://robohash.org/$id.png/?set=set4"));

        if (response.statusCode != 200) {
          throw Exception('Failed to load image for $type');
        }

        return DiseaseEntity(
          id: id,
          name: type,
          description: "This is a description of $type",
          image: response.bodyBytes, // Use bodyBytes to get Uint8List
          createdAt: DateTime.now(),
          createdBy: "secret",
        );
      }),
    );

    final learn = [
      LearnEntity(
        disease: diseases[0],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[1],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[2],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[3],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[4],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[5],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[6],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[7],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[8],
        description:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        symptoms:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
        treatment:
            "Discover how to identify and treat these diseases to keep your trees thriving!",
      ),
      LearnEntity(
        disease: diseases[9],
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
