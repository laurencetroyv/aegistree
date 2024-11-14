import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      "Bacterial Leaf Blight",
      "Canker",
      "Downy mildew",
      "Powdery mildew",
      "Rust",
      "Shot hole",
      "Leaf spot",
      "Sooty mold",
    ];

    final anthracnose = await rootBundle
        .load('assets/images/diseases/anthracnose.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final blackSpot = await rootBundle
        .load('assets/images/diseases/black_spot-sm.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final bacterialBlight = await rootBundle
        .load('assets/images/diseases/BacterialBlight.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final cancker = await rootBundle
        .load('assets/images/diseases/canker.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final downyMildew = await rootBundle
        .load('assets/images/diseases/downy-mildew.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final powederyMildew = await rootBundle
        .load('assets/images/diseases/powdery_mildew.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final rust = await rootBundle
        .load('assets/images/diseases/rust.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final shothole = await rootBundle
        .load('assets/images/diseases/Shothole.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final leafSpot = await rootBundle
        .load('assets/images/diseases/leaf_spot.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    final sootyMold = await rootBundle
        .load('assets/images/diseases/sooty_mold.jpg')
        .then((onValue) => onValue.buffer.asUint8List());

    return [
      LearnEntity(
        disease: DiseaseEntity(
          id: "0",
          name: diseaseTypes[0],
          description:
              "Anthracnoses, meaning blackenings, are diseases of the foliage, stems, or fruits that typically appear as dark-colored spots or sunken lesions with a slightly raised rim. Some cause twig or branch dieback. In fruit infections, anthracnoses often have a prolonged latent stage. In some fruit crops, the spots are raised and have corky surfaces. Anthracnose diseases of fruit often result in fruit drop and fruit rot. Anthracnoses (from anthrax=carbon=black) are caused by fungi that produce conidia within black acervuli. Four ascomycetous fungi, Diplocarpon, Elsinoe, Glomerella, and Gnomonia, are responsible for most anthracnose diseases. They are found in nature mostly in their conidial stage and can overwinter as mycelium or conidia.",
          // image: leafImages[0],
          image: anthracnose,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Anthracnoses, meaning blackenings, are diseases of the foliage, stems, or fruits that typically appear as dark-colored spots or sunken lesions with a slightly raised rim. Some cause twig or branch dieback. In fruit infections, anthracnoses often have a prolonged latent stage. In some fruit crops, the spots are raised and have corky surfaces. Anthracnose diseases of fruit often result in fruit drop and fruit rot. Anthracnoses (from anthrax=carbon=black) are caused by fungi that produce conidia within black acervuli. Four ascomycetous fungi, Diplocarpon, Elsinoe, Glomerella, and Gnomonia, are responsible for most anthracnose diseases. They are found in nature mostly in their conidial stage and can overwinter as mycelium or conidia.",
        symptoms:
            "Anthracnose has a necrotic and sunken ulcer-like lesion on the stem, leaf, fruit, or flower of the host plant caused mainly by a certain group of fungi.",
        treatment:
            "Control of the disease is primarily through cultural practices, such as avoiding excessive fertilization and overhead irrigation, improving air circulation among plants, removing infected canes and wild bramble plants from the vicinity of the planting, and applying of appropriate fungicides.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "1",
          name: diseaseTypes[1],
          description:
              "Black spot, common disease of a variety of plants caused by species of Pseudomonas bacteria or by any number of fungus species in the genera Asterina, Asterinella, Diplotheca, Glomerella, Gnomonia, Schizothyrium, Placosphaeria, and Stigmea. Infections occur during damp periods and appear as round to irregular black spots on leaves and sometimes on petioles, stems, and flower parts of susceptible plants.",
          image: blackSpot,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Black spot, common disease of a variety of plants caused by species of Pseudomonas bacteria or by any number of fungus species in the genera Asterina, Asterinella, Diplotheca, Glomerella, Gnomonia, Schizothyrium, Placosphaeria, and Stigmea. Infections occur during damp periods and appear as round to irregular black spots on leaves and sometimes on petioles, stems, and flower parts of susceptible plants.",
        symptoms:
            "The black spot appears as black lesions on the leaves and as raised, purple- red blotches on immature wood of first-year canes. The leaf spots have fringed margins and may coalesce to produce large, irregular, black lesions. The leaf tissue around the lesions turns yellow, and often entire leaves become yellow and fall off prematurely, leaving the canes almost completely defoliated.",
        treatment:
            "The control of Diplocarpon diseases is through sanitation (e.g., removing and burning infected leaves, cutting back the canes of diseased plants), spraying with one of several available fungicides, or applying sulfur-copper dust. Applications should begin as soon as new leaves appear in the spring or at the first appearance of black spot on the foliage and then should be repeated at 7- to 10-day intervals or within 24 hours after each rain.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "2",
          name: diseaseTypes[2],
          description:
              "Blight is a general and extremely rapid browning and death of leaves, branches twigs, and floral organs. Most blights are caused by bacterial or fungal infestations, which usually attack the shoots and other young, rapidly growing tissues of a plant. Fungal and bacterial blights are most apt to occur under cool moist conditions.",
          image: bacterialBlight,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Blight is a general and extremely rapid browning and death of leaves, branches twigs, and floral organs. Most blights are caused by bacterial or fungal infestations, which usually attack the shoots and other young, rapidly growing tissues of a plant. Fungal and bacterial blights are most apt to occur under cool moist conditions.",
        symptoms:
            "Blight, any of various plant diseases whose symptoms include sudden and severe yellowing, browning, spotting, withering, or dying of leaves, flowers, fruit, stems, or the entire plant.",
        treatment:
            "Leaf blight can be controlled using a combination of cultural, chemical, and biological methods. Remove infected leaves and plant debris, improve air circulation, and avoid overhead watering to reduce the spread of the disease. For fungal blights, use fungicides like copper-based products or sulfur, while bacterial blights can be managed with bactericides. Beneficial microbes like *Trichoderma* or *Bacillus* spp. can also help. Choose resistant plant varieties when possible, and ensure proper fertilization and stress management to keep plants healthy. Early detection and regular monitoring are key to effective control, along with sanitation and crop rotation to break the disease cycle.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "3",
          name: diseaseTypes[3],
          description:
              "Relatively few canker diseases are caused by bacteria, but some of them are widespread and devastating. In many bacterial cankers, the canker symptoms on stem, branches, or twigs are accompanied by direct symptoms on fruits, leaves, buds, or blossoms that may be at least as important in the overall effect of the disease on the tree as are the cankers. ",
          image: cancker,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Relatively few canker diseases are caused by bacteria, but some of them are widespread and devastating. In many bacterial cankers, the canker symptoms on stem, branches, or twigs are accompanied by direct symptoms on fruits, leaves, buds, or blossoms that may be at least as important in the overall effect of the disease on the tree as are the cankers. ",
        symptoms:
            "The lesions at first appear as small, slightly raised, round, light green spots. Later, they become grayish white, rupture, and appear corky with brown, sunken centers. The margins of the lesions are often surrounded by a yellowish halo. The size of the lesions varies from 1 to 9 millimeters in diameter on leaves and up to 1 centimeter in diameter or length on fruits and twigs. ",
        treatment:
            "The control of bacterial cankers is through proper sanitation and eradication practices, through the use of bacteria-free seeds or budwood, and somewhat through several sprays with the Bordeaux mixture, other copper formulations, or antibiotics.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "4",
          name: diseaseTypes[4],
          description:
              "Downy mildews are primarily foliage blights. They attact and spread rapidly in young, tender green leaf, twig, and fruit tissues. They develop when a film of water is present on the plant tissues and the relative humidity in the air is high during cool or warm, but not hot, periods. Downy mildews can cause severe losses in short periods of time. Downy mildews often cause rapid and severe losses of young crop plants still in the seedbed or in the field. They often destroy from 40 to 90% of the young plants or young shoots in the field, causing heavy or total losses of crop yields. The severity of loss depends on the prolonged presence of wet, cool weather during which the downy mildews sporulate profusely, cause numerous new infections, and spread into and rapidly kill young succulent tissues. In cool, wet weather downy mildews are often uncontrollable, checked only when the weather turns hot and dry. Appearance of white downy growth in patches on the lower surface of the leaves and yellow discolouration correspondingly on the upper surface. Downy mildew fungi are obligate parasites belonging to the family peronosporaceae of the subdivision Mastigomycotina that cause downy mildew disease. They produce sporangia during asexual reproduction and oospores during sexual reproduction. Sporangiophore branching characters of genera, which cause downy mildew diseases are given below.",
          image: downyMildew,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Downy mildews are primarily foliage blights. They attact and spread rapidly in young, tender green leaf, twig, and fruit tissues. They develop when a film of water is present on the plant tissues and the relative humidity in the air is high during cool or warm, but not hot, periods. Downy mildews can cause severe losses in short periods of time. Downy mildews often cause rapid and severe losses of young crop plants still in the seedbed or in the field. They often destroy from 40 to 90% of the young plants or young shoots in the field, causing heavy or total losses of crop yields. The severity of loss depends on the prolonged presence of wet, cool weather during which the downy mildews sporulate profusely, cause numerous new infections, and spread into and rapidly kill young succulent tissues. In cool, wet weather downy mildews are often uncontrollable, checked only when the weather turns hot and dry. Appearance of white downy growth in patches on the lower surface of the leaves and yellow discolouration correspondingly on the upper surface. Downy mildew fungi are obligate parasites belonging to the family peronosporaceae of the subdivision Mastigomycotina that cause downy mildew disease. They produce sporangia during asexual reproduction and oospores during sexual reproduction. Sporangiophore branching characters of genera, which cause downy mildew diseases are given below.",
        symptoms:
            "At first, small, pale yellow, irregular spots appear on the upper surface of the leaves, and a white downy growth of the sporangiophores of the oomycete appears on the underside of the spots. Later, the infected leaf areas are killed and trun brown, while the sporangiophores of the oomycete turn gray. The spots often enlarge, coalesce to form large dead areas on the leaf, and frequently result in premature defoliation. Pale yellow discolouration of leaves; whitish fungal growth on the lower surface of leaves; twisting and crinkling of leaves; drying of leaves; infected seedlings when planted die within 30 days; green ear symptom i.e., transformation of floral parts into green leaf-like structures. Symptoms often vary as a result of systemic infection.",
        treatment:
            "The most effective fungicides for the control of downy mildew have been copper-based products such as the Bordeaux mixture, some broad-spectrum protective fungicides, and several systematic fungicides. The applications begin before bloom and are continued at 7- to 10-day intervals or, depending on the frequency and duration of rainfall, during the growing season. Disease predictions system, based on the duration of leaf wetness, relative humidity, and temperature, are used to identify infection periods and to time fungicide applications. In recent years, sprays of systemic fungicides in combination with copper or broad-spectrum preventive fungicides have given excellent control of downy mildew.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "5",
          name: diseaseTypes[5],
          description:
              "Powdery mildews are probably the most common, conspicuous, widespread, and easily recognizable plant diseases. They affect all kinds of plants except gymnosperms.",
          image: powederyMildew,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Powdery mildews are probably the most common, conspicuous, widespread, and easily recognizable plant diseases. They affect all kinds of plants except gymnosperms.",
        symptoms:
            "Powdery mildews appear as spots or patches of a white to grayish, powdery, mildewy growth on young plant tissues or as entire leaves and other organs being completely covered by the white powdery mildew. Tiny, pinhead-sized, spherical, at first white, later yellow-brown, and finally black cleistothecia may be present singly or in groups on the white to grayish mildew in the older areas of infection. Powdery mildew is most common on the upper side of leaves, but it also affects the underside of leaves, young shoots and stems, buds, flowers, and young fruit.",
        treatment:
            "The control of powdery mildews in crops depends on dusting the plants with sulfur. In cereals and several other annual crops, powdery mildew control is primarily through the use of resistant varieties. More recently, powdery mildew control has been obtained with systemic fungicides used as seed treatments or as foliar sprays. The same chemicals are used as sprays for the control of powdery mildews in other crops and in ornamentals. Several powdery mildew fungi, however, have developed resistance and are no longer controlled effectively with sprays of any of several sterol-inhibiting systemic fungicides. Powdery mildews have also been controlled experimentally with sprays of phosphate salt solutions and detergents or ultrafine oils and, in the greenhouse, by using blue photosensitive polyyethylene sheeting. Experimentally, powdery mildew control has also been obtained through sprays with the biocontrol fungus Ampelomyces quisqualis and with plant activator compounds.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "6",
          name: diseaseTypes[6],
          description:
              "Rusts, caused by Basidiomycetes of the order Uredinales, are among the most destructive plant diseases. Rust fungi attack mostly leaves and stems. Rust infections usually appear as numerous rusty, orange, yellow, or even white-colored spots that rupture the epidermis.",
          image: rust,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Rusts, caused by Basidiomycetes of the order Uredinales, are among the most destructive plant diseases. Rust fungi attack mostly leaves and stems. Rust infections usually appear as numerous rusty, orange, yellow, or even white-colored spots that rupture the epidermis.",
        symptoms:
            "Symptoms appear as orange-yellow powdery spots on the lower side of the leaves. The spots are circular and small, about 5 millimeters in diameter, at first, but they often coalesce and form large patches that may be 10 times as large. The centers of the spots eventually become dry and turn brownish, and the leaves fall off prematurely. Many small lesions on leaves or stems, usually of a rusty color.",
        treatment:
            "The control of rust is difficult, but satisfactory results can be obtained with copper fungicides. Fungicides must be applied before and during the rainy season at 2- to 3-week intervals or less, depending on weather conditions and the severity of the attack. Systemic fungicides, which have a curative effect on developing uredial pustules, have been used in alternate applications with the copper fungicides. Sufficient tree pruning, good site selection, and use of resistant varieties help minimize losses from the rust.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "7",
          name: diseaseTypes[7],
          description:
              "Shot hole disease, or coryneum blight, is caused by the fungus Wilsonomyces carpophilus. A perforated appearance of a leaf as the dead areas of local lesion drop out.",
          image: shothole,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Shot hole disease, or coryneum blight, is caused by the fungus Wilsonomyces carpophilus. A perforated appearance of a leaf as the dead areas of local lesion drop out.",
        symptoms:
            "Affects fruits, buds, and stems, but is most obvious on the leaves. First appear as small red spots on leaves which enlarge and become purple with a white center. Spots then drop out of the leaf to leave a BB-sized “shothole.” Numerous holes result from severe infections, making leaves look tattered.",
        treatment:
            "Prevent foliage from getting wet by using drip irrigation, low-volume sprinklers, sprinkler deflectors, and pruning off lower branches. Prune and dispose of diseased plant tissue as soon as it appears. And apply fixed copper fungicides or certain synthetic fungicides such as chlorothalonil.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "8",
          name: diseaseTypes[8],
          description:
              "Leaf spots is a localized lesions on host leaves consisting of dead and collapsed cells. Discrete lesions of dead cells on leaf tissue between or on leaf veins, often with a light-colored center and a distinct darkcolored border and sometimes accompanied by a yellow halo; fruiting structures of fungus often evident in dead tissue",
          image: leafSpot,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Leaf spots is a localized lesions on host leaves consisting of dead and collapsed cells. Discrete lesions of dead cells on leaf tissue between or on leaf veins, often with a light-colored center and a distinct darkcolored border and sometimes accompanied by a yellow halo; fruiting structures of fungus often evident in dead tissue",
        symptoms:
            "Leaf spots come in a wide variety of shapes, sizes and colors. Leaf spot diseases usually are seen first on the lower and inner branches where humidity is higher and leaves are shaded.Leaf spots may be angular or rounded, raised or sunken, and have smooth or fringed edges.Colors can range from yellow to yellow-green to orange-red to light tan, brown or black.",
        treatment:
            "Leaf spot diseases will not seriously harm your plants, but there are things you can do that when done together, can reduce the disease on the tree in the following years. Prune trees or shrubs to increase light penetration and improve air circulation throughout the canopy. Wet conditions promote disease, so water trees at the base and be careful not to splash water on leaves. Water your tree throughout the growing season so that the top 6 to 8 inches of the soil is moist, especially during dry summers. Do not fertilize trees and shrubs with leaf spot diseases unless a soil test recommends it to correct a nutrient deficiency.",
      ),
      LearnEntity(
        disease: DiseaseEntity(
          id: "9",
          name: diseaseTypes[9],
          description:
              "Sooty molds appear on the leaves or stems of plants as a superficial, black growth of mycelium forming a film or crust on these plant parts. Sooty molds may be found on all types of plants. They are most common in warm, humid weather. Sooty molds are caused by several species of fungi of various types, but primarily dark-colored Ascomycetes of the order Capnodiales. These fungi, e.g., Capnodium, are not parasitic but live off honeydew, the sugary deposit forming on plant parts from the droppings of certain insects, particularly aphids and scale insects. The fungal growth is so abundant that it gives the leaf a black, sooty appearance and interferes with the amount of light that reaches the plant. This mycelium soemtimes forms a black papery layer that can be peeled off from the underlying leaf. The presence of sooty mold fungi is usually of rather minor importance to the health of the plant, but it does indicate the presence of insects and may be a warning of a severe aphid or scale problem.",
          image: sootyMold,
          createdAt: DateTime.now(),
          createdBy: "secret",
        ),
        description:
            "Sooty molds appear on the leaves or stems of plants as a superficial, black growth of mycelium forming a film or crust on these plant parts. Sooty molds may be found on all types of plants. They are most common in warm, humid weather. Sooty molds are caused by several species of fungi of various types, but primarily dark-colored Ascomycetes of the order Capnodiales. These fungi, e.g., Capnodium, are not parasitic but live off honeydew, the sugary deposit forming on plant parts from the droppings of certain insects, particularly aphids and scale insects. The fungal growth is so abundant that it gives the leaf a black, sooty appearance and interferes with the amount of light that reaches the plant. This mycelium soemtimes forms a black papery layer that can be peeled off from the underlying leaf. The presence of sooty mold fungi is usually of rather minor importance to the health of the plant, but it does indicate the presence of insects and may be a warning of a severe aphid or scale problem.",
        symptoms:
            "Sooty mold is usually a black powdery coating that develops on leaves and twigs. Sometimes the black layer may be hard and stick tightly to the leaf. During spring rains, the black layer may flake off or peel away from part of the leaf, leaving healthy looking green areas with splotches of the black sooty mold.",
        treatment:
            "No control measures are applied against the sooty mold fungi. Because they grow on the excretions of insects, control of the particular insect with the appropriate insecticide or other means also results in the elimination of the sooty mold fungi.",
      ),
    ];
  }
}
