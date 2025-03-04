import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'solution_provider.g.dart';

@Riverpod(keepAlive: true)
class Solution extends _$Solution {
  @override
  List<SolutionEntity> build() {
    return [
      SolutionEntity(
        id: "534ba6ab-36f1-4b18-93f0-715fd0ea2903",
        name: "Black Rot",
        solution:
            "To manage the disease, remove and destroy infected plants immediately to prevent spread, and improve airflow by spacing plants properly. Water at the base to avoid splashing bacteria onto healthy plants and practice crop rotation to limit the bacteria's survival in soil. Copper-based bactericides or products containing beneficial bacteria like Streptomyces can help control the disease. Additionally, choosing resistant plant varieties, providing balanced fertilization, and minimizing plant stress will promote healthier, more disease-resistant crops. Regular monitoring and good sanitation practices, such as disinfecting tools, are also crucial for preventing further infection.",
        learnMore:
            """The disease is present throughout the world. The first symptoms, however, usually appear in the field as large, often V-shaped, chlorotic blotches at the margins of the leaves. The chlorosis progresses toward the midrib of the leaf, while some of the veins and veinlets within the chlorotic area turn black. The affected area later turns brown and dry. In the meantime, the blackening of the veins advances to the stem and from there upward and downward to other leaves and roots. When leaves become invaded systemically from bacteria moving upward through the midvein, chlorotic areas may appear anywhere on the leaves. Infected leaves may fall off prematurely one after the other.
The Black rot bacteria infect cotyledons or young leaves through stomata, hydathodes, or wounds and spread through them intercellularly until they reach the open ends of outer vessels, which they invade. Bacteria often ooze to the surface of the leaves through hydathodes or wounds and are subsequently spread by rain splashes and wind or are carried by equipment, to other leaves, which they infect. In wet, warm weather, infection develops rapidly, and visible symptoms may appear within hours.
""",
        actions: ActionEntity(
          watered: "Water the plant at the base, avoiding wetting the leaves.",
          fertilized:
              "Apply a balanced fertilizer to support healthy growth without promoting excessive foliage.",
          leavesCleaned:
              "Remove and dispose of infected or fallen leaves to prevent the spread of black rot.",
        ),
        requirements: ActionEntity(
          watered:
              "Use drip irrigation or a soaker hose system, ensuring the soil is moist but well-drained. Avoid overhead watering, which increases moisture on leaves and promotes fungal growth.",
          fertilized:
              "Avoid high-nitrogen fertilizers, which can lead to overly lush foliage that is more vulnerable to disease.",
          leavesCleaned:
              "Regularly inspect plants for new signs of infection and remove affected leaves immediately.",
        ),
      ),
      SolutionEntity(
        id: "c8cffdb6-33a2-4151-9172-c2cbc4063f85",
        name: "Bacterial Spot",
        solution:
            "The control of bacterial spots can be obtained to some extent by the use of resistant varieties, crop rotation, and sanitation. Some control can be obtained by spraying several times during the period of plant susceptibility with chemicals such as copper compounds mixed with zineb, maneb, or mancozeb, antibiotics such as streptomycin and tetracyclines, and, in some cases, with plant defense activators.",
        learnMore:
            """It may cause serious losses by reducing the marketability of the fruit and by weakening trees through leaf spots, defoliation, and lesions on twigs. 
Symptoms appear on the leaves as circular to irregular, water-soaked spots about 1 to 5 millimeters in diameter, which later turn purple or brown. Often halos and cracks develop around the spots, and the affected areas break away from the surrounding healthy tissue, drop out, and give a shot-ridden appearance, known as shot hole, to the leaves.Several spots may coalesce. Severely affected leaves turn yellow and drop.
In the spring they ooze out and are spread by rain splashes and insects to young leaves, fruits, and twigs, which they infect through natural openings, leaf scars, and wounds. The disease is more severe on weakened trees than on vigorous ones: therefore, keeping trees in good vigor helps them resist the disease.
""",
        actions: ActionEntity(
          watered:
              "Water plants at the base to prevent splashing, which can spread bacteria to other parts of the plant and nearby plants.",
          fertilized:
              "Apply a balanced, moderate fertilizer to strengthen plant defenses without promoting excessive, vulnerable foliage.",
          leavesCleaned:
              "Remove and dispose of any infected leaves and plant debris to reduce bacterial spread.",
        ),
        requirements: ActionEntity(
          watered:
              "Ensure plants have adequate moisture, but avoid overhead watering, especially during warm, humid conditions when bacteria spread most easily.",
          fertilized:
              "Use a fertilizer with balanced nutrients, applying it early in the growing season.",
          leavesCleaned:
              "Prune infected leaves with sterilized tools and immediately discard them away from the garden area.",
        ),
      ),
      SolutionEntity(
        id: "25909366-0017-40d2-af3a-8995791759c3",
        name: "Scab",
        solution:
            "The control of scab diseases is obtained through application of appropriate fungicides and planting resistant varieties. For an effective scab control program, trees must be sprayed or dusted diligently before, during, or immediately after a rain from the time of budbreak until all the ascospores are discharged from pseudothecia. If these primary infections from ascospores are prevented, there will be less need to spray for scab during the remainder of the season. If primary infections do develop, spraying will have to be continued throughout the season. In most areas, the application of fungicides for scab control begins when buds show a slight green tip and a rainy period is sufficiently long at the existing temperature to produce an infection, Sprays are repeated every 5 to 7 days, or according to rainfall, until petal fall. After petal fall, and depending on the success of the control program to that point, sprays are usually repeated every 10 to 14 days for several more times.",
        learnMore:
            "Scab is a localized lesions on host fruit, leaves, tubers, etc., usually slightly raised or sunken and cracked, giving a scabby appearance. Scab stromata at first are pink to light brown but later become corky and turn yellowish, grayish brown, or dark. Lesions also form on the leaves, which eventually become crinkled and distorted.Scab diseases thrive in humid, wet conditions and can lead to reduced plant vigor, deformities, and yield loss.",
        actions: ActionEntity(
          watered:
              "Water plants at the base, avoiding contact with foliage to prevent spreading the scab spores.",
          fertilized:
              "Apply a balanced fertilizer to strengthen trees, making them more resistant to scab.",
          leavesCleaned:
              "Remove and dispose of infected or fallen leaves to limit the scab spores in the area.",
        ),
        requirements: ActionEntity(
          watered:
              "Avoid watering during the late afternoon or evening to reduce humidity overnight, which encourages fungal growth.",
          fertilized:
              "Choose a balanced fertilizer and apply early in the season to support healthy growth. Avoid excessive nitrogen, as overly lush foliage is more susceptible to infections.",
          leavesCleaned:
              "Regularly inspect trees for signs of scab, removing any infected leaves and disposing of them far from the garden. Rake up and dispose of fallen leaves around the base of the tree after the growing season, as these can harbor fungal spores that reinfect in spring.",
        ),
      ),
      SolutionEntity(
        id: "3d84a4ec-9edd-4979-a727-6e451d95f56c",
        name: "Rust",
        solution:
            "The control of rust is difficult, but satisfactory results can be obtained with copper fungicides. Fungicides must be applied before and during the rainy season at 2- to 3-week intervals or less, depending on weather conditions and the severity of the attack. Systemic fungicides, which have a curative effect on developing uredial pustules, have been used in alternate applications with the copper fungicides. Sufficient tree pruning, good site selection, and use of resistant varieties help minimize losses from the rust.",
        learnMore:
            """Rust diseases are common plant fungal diseases, belonging to the order Pucciniales. A type of disease caused by a specific group of fungi, often producing orange-red "rust" colored spores.
            Rust diseases go through different stages, but they all eventually form blister-like, powdery pustules. The pustules typically occur on the undersides of leaves, but stems and upper leaf surfaces can develop pustules, too. Most affected edibles and ornamentals show rusty yellow, orange and brown pustules, but some types of rust appear purple-brown or even black.
Affected leaf areas turn yellow and brown as infections expand. Distorted leaves turn dry and fall from plants. In hollyhocks, heavy infestations leave entire plants rusty orange. Geraniums develop cinnamon-colored pustules underneath leaves, with circular yellow spots on top. Hydrangea foliage shows dark, coppery leaf spots and red-orange pustules on leaf undersides.
            """,
        actions: ActionEntity(
          watered: "Water at the base of plants to prevent wetting leaves",
          fertilized:
              "Apply a balanced fertilizer to support strong, resilient growth without promoting overly lush foliage.",
          leavesCleaned:
              ": Remove and dispose of infected leaves and any fallen debris to reduce the spread of rust spores.",
        ),
        requirements: ActionEntity(
          watered:
              "Water plants in the morning, allowing moisture on any leaves to dry quickly in the sunlight and reducing the risk of rust development.",
          fertilized:
              "Avoid excessive nitrogen, as it encourages tender, vulnerable growth that is more susceptible to rust.",
          leavesCleaned:
              "Regularly inspect tree leaves for signs of rust, promptly removing infected leaves and disposing of them away from the garden. Clean up fallen leaves around plants at the end of the season, as these can harbor overwintering spores.",
        ),
      ),
      SolutionEntity(
        id: "98b9477d-a0ce-4d35-bc23-889fe938f6b2",
        name: "Leaf Scorch",
        solution:
            "To manage leaf scorch, ensure the tree receives deep, consistent watering during dry periods, focusing on the root zone rather than shallow watering, which can increase stress. Adding a 2-4 inch layer of mulch around the base of the tree—keeping it a few inches from the trunk—helps retain soil moisture. Avoid applying excess fertilizer, as it can worsen scorch symptoms, especially in dry conditions; only fertilize if the soil lacks nutrients. Reducing soil compaction around the tree by aerating the soil can also improve root health and water absorption. Additionally, pruning dead or damaged branches can help reduce overall stress, allowing the tree to channel energy into healthy growth. For young or smaller trees, providing temporary shade in extremely hot conditions can also help alleviate stress. With consistent care and preventive practices, the effects of leaf scorch can be managed and minimized.",
        learnMore:
            "Leaf scorch is burning of leaf margins as a result of infection or unfavorable environmental conditions. A physiological condition where tree leaves turn brown or appear \"scorched\" around the edges. It's typically caused by environmental stress factors rather than a specific pathogen. Leaf scorch commonly occurs due to hot, dry weather, poor watering practices, soil compaction, or root damage, which can disrupt the tree's ability to uptake enough water to meet its needs. Leaves develop brown or yellow edges, with some leaves eventually turning completely brown. Unlike diseases caused by pathogens, leaf scorch doesn't produce distinct lesions or fungal growth. In severe cases, leaves may prematurely drop.",
        actions: ActionEntity(
          watered:
              "Deeply water the plant during dry periods to ensure moisture reaches the root zone.",
          fertilized:
              "Apply a balanced fertilizer to support overall plant health without stressing it with excessive nutrients.",
          leavesCleaned:
              "Prune dead or damaged leaves and branches to reduce stress on the plant and help it focus on healthy growth.",
        ),
        requirements: ActionEntity(
          watered:
              "Water in the morning to reduce evaporation and help the plant retain moisture throughout the day. Avoid shallow watering, which does not adequately hydrate the roots and can worsen symptoms.",
          fertilized:
              "Avoid over-fertilizing, as too much fertilizer can exacerbate leaf scorch by stressing the roots or promoting lush growth that cannot be adequately hydrated during dry periods.",
          leavesCleaned:
              "Regularly monitor and trim as needed, especially during hot and dry weather.",
        ),
      ),
      SolutionEntity(
        id: "fbe26023-5fb9-4478-b73d-d562a57c843d",
        name: "Leaf Spot",
        solution:
            "To manage leaf spot, start by removing and disposing of fallen leaves and infected plant debris, which can harbor spores and reinfect the tree. Pruning affected branches can improve air circulation, reducing moisture around the leaves and making conditions less favorable for disease. Avoid overhead watering, as wet leaves create an ideal environment for fungal and bacterial growth; instead, water at the base of the tree. Applying a layer of mulch around the base can help reduce soil splash, which can spread spores onto leaves. If the infection is severe or persistent, a fungicidal treatment may be beneficial, particularly in spring when new growth is emerging. Practicing good sanitation and ensuring the tree is properly spaced to allow airflow are essential preventive measures to help control and reduce the impact of leaf spot.",
        learnMore:
            "Leaf spot is a common fungal or bacterial disease that affects many tree species, causing unsightly spots on leaves and, in severe cases, premature leaf drop. The disease thrives in warm, wet conditions, where spores are easily spread by wind and rain, infecting leaves and leaving noticeable spots. These spots often start as small, dark lesions that expand over time, typically with a yellow or brown halo. While leaf spot diseases are usually more cosmetic than fatal, they can weaken trees if severe or recurring over several years.",
        actions: ActionEntity(
          watered: "Water at the base of plants to minimize moisture on leaves",
          fertilized:
              "Apply a balanced fertilizer to maintain plant health without promoting excessive, tender growth.",
          leavesCleaned:
              "Remove and dispose of infected leaves and plant debris to limit the spread of the disease.",
        ),
        requirements: ActionEntity(
          watered:
              "Water early in the morning so any incidental moisture on leaves can dry quickly with sunlight. Avoid overhead watering, as wet foliage encourages the spread of leaf spot pathogens.",
          fertilized:
              "Fertilizing early in the growing season strengthens plants, making them less vulnerable to leaf spot.",
          leavesCleaned:
              "Clean up any fallen leavesl around the base of plants after the growing season, as these can harbor pathogens. Use sterilized pruning tools to prevent spreading the disease to healthy parts of the plant.",
        ),
      ),
      SolutionEntity(
        id: "3edbc092-e4d2-4547-b2c8-a9871a13b620",
        name: "Leaf Blight",
        solution:
            "Leaf blight can be controlled using a combination of cultural, chemical, and biological methods. Remove infected leaves and plant debris, improve air circulation, and avoid overhead watering to reduce the spread of the disease. For fungal blights, use fungicides like copper-based products or sulfur, while bacterial blights can be managed with bactericides. Beneficial microbes like *Trichoderma* or *Bacillus* spp. can also help. Choose resistant plant varieties when possible, and ensure proper fertilization and stress management to keep plants healthy. Early detection and regular monitoring are key to effective control, along with sanitation and crop rotation to break the disease cycle.",
        learnMore:
            "Blight is a general and extremely rapid browning and death of leaves, branches twigs, and floral organs. Most blights are caused by bacterial or fungal infestations, which usually attack the shoots and other young, rapidly growing tissues of a plant. Fungal and bacterial blights are most apt to occur under cool moist conditions. Blight, any of various plant diseases whose symptoms include sudden and severe yellowing, browning, spotting, withering, or dying of leaves, flowers, fruit, stems, or the entire plant.",
        actions: ActionEntity(
          watered:
              "Water at the base of the plant to prevent moisture from collecting on leaves and reducing the spread of the disease.",
          fertilized:
              "Apply a balanced, controlled-release fertilizer to support plant health, but avoid over-fertilizing, which can make plants more susceptible to diseases.",
          leavesCleaned:
              "Regularly remove and dispose of infected leaves and plant debris to limit the spread of the disease.",
        ),
        requirements: ActionEntity(
          watered:
              "Water in the early morning so that any moisture on the leaves can dry quickly, reducing the risk of infection.",
          fertilized:
              "Apply it in the early spring to ensure proper growth and disease resistance. Avoid excess nitrogen, which promotes lush, soft growth that is more prone to blight infections.",
          leavesCleaned:
              ": Inspect plants for symptoms of leaf blight and remove any infected leaves immediately. Dispose of them away from the garden.",
        ),
      ),
      SolutionEntity(
        id: "b3671f55-bde0-4aca-bc15-5c2d90bf2f81",
        name: "Late Blight",
        solution:
            "To manage late blight, prioritize preventive measures and early intervention. Use resistant varieties of plants where available, and ensure proper crop spacing to improve airflow and reduce leaf wetness. Avoid overhead watering, as moisture on leaves promotes the spread of late blight. Fungicides with active ingredients like chlorothalonil or copper can be used preventively or at the first signs of infection, particularly in humid, wet conditions when late blight is most likely to spread. Remove and destroy infected plants immediately to prevent the disease from spreading, as spores can overwinter in plant debris or tubers.",
        learnMore:
            "Late blight is a severe fungal-like disease caused by Phytophthora infestans, which affects plants in the nightshade family. The disease thrives in cool, wet conditions and spreads rapidly, causing dark, water-soaked lesions on leaves, stems, and fruit. As it progresses, these lesions develop a characteristic white moldy growth on the underside of leaves, leading to plant decay and death if left untreated. Late blight can wipe out entire crops and spread through spores carried by wind and rain, making control and prevention essential.",
        actions: ActionEntity(
          watered:
              "Water at the base of the plant to avoid wetting foliage, which minimizes favorable conditions for late blight.",
          fertilized:
              "Apply a balanced fertilizer to support healthy plant growth and improve resilience against infections.",
          leavesCleaned:
              "Promptly remove and dispose of infected leaves and plants to stop the spread of late blight.",
        ),
        requirements: ActionEntity(
          watered:
              "Water early in the day, allowing any moisture on leaves to evaporate quickly. This helps reduce humidity around plants and discourages blight.",
          fertilized:
              "Apply according to the plant’s growth stage and soil requirements, avoiding over-fertilization, which can stress plants and increase susceptibility to disease.",
          leavesCleaned:
              "Regularly inspect plants for symptoms and remove infected parts immediately.",
        ),
      ),
      SolutionEntity(
        id: "450ce5c9-8be4-4e44-a037-b2ab6072fd72",
        name: "Powdery Mildew",
        solution:
            "The control of powdery mildews in crops depends on dusting the plants with sulfur. In cereals and several other annual crops, powdery mildew control is primarily through the use of resistant varieties. More recently, powdery mildew control has been obtained with systemic fungicides used as seed treatments or as foliar sprays. The same chemicals are used as sprays for the control of powdery mildews in other crops and in ornamentals. Several powdery mildew fungi, however, have developed resistance and are no longer controlled effectively with sprays of any of several sterol-inhibiting systemic fungicides. Powdery mildews have also been controlled experimentally with sprays of phosphate salt solutions and detergents or ultrafine oils and, in the greenhouse, by using blue photosensitive polyyethylene sheeting. Experimentally, powdery mildew control has also been obtained through sprays with the biocontrol fungus Ampelomyces quisqualis and with plant activator compounds.",
        learnMore:
            "Powdery mildews are probably the most common, conspicuous, widespread, and easily recognizable plant diseases. They affect all kinds of plants except gymnosperms. Powdery mildews appear as spots or patches of a white to grayish, powdery, mildewy growth on young plant tissues or as entire leaves and other organs being completely covered by the white powdery mildew. Tiny, pinhead-sized, spherical, at first white, later yellow-brown, and finally black cleistothecia may be present singly or in groups on the white to grayish mildew in the older areas of infection. Powdery mildew is most common on the upper side of leaves, but it also affects the underside of leaves, young shoots and stems, buds, flowers, and young fruit.",
        actions: ActionEntity(
          watered:
              "Water at the base of plants to prevent moisture from sitting on the leaves.",
          fertilized:
              "Apply balanced fertilization to promote healthy growth, but avoid excessive nitrogen, which can increase susceptibility to powdery mildew.",
          leavesCleaned:
              "Remove infected leaves and plant debris to reduce the spread of the fungus.",
        ),
        requirements: ActionEntity(
          watered:
              "Avoid overhead watering, as this keeps the leaves wet and creates an environment conducive to powdery mildew growth. ",
          fertilized:
              "Avoid high-nitrogen fertilizers, which encourage soft, lush growth that is more prone to powdery mildew infection.",
          leavesCleaned:
              "Regularly inspect plants for signs of powdery mildew, and remove any affected leaves immediately.",
        ),
      ),
      SolutionEntity(
        id: "7582e024-4e7c-437b-b8f5-9fe76a7da85f",
        name: "Black Measles",
        solution:
            "Start by pruning and disposing of infected shoots and branches to reduce fungal inoculum. Proper irrigation practices are essential, as stress from drought can exacerbate symptoms; water consistently but avoid waterlogging. Applying fungicides at key times, such as post-harvest or early spring, can help reduce disease spread, although these treatments primarily manage symptoms rather than eliminate the fungi.",
        learnMore:
            "Black measles is a fungal disease, also known as esca or grapevine measles. It is caused by a complex of fungi, including Phaeomoniella chlamydospora and Phaeoacremonium species. This disease causes small, dark, measle-like spots on leaves, which can expand and turn yellow or brown with distinctive black margins, giving the foliage a scorched appearance. The disease can also affect the wood and fruit, leading to vine decline over time. ",
        actions: ActionEntity(
          watered:
              "Water the plants at the base to prevent moisture from splashing onto the leaves, which can spread the fungal spores.",
          fertilized:
              "Apply a balanced fertilizer to ensure healthy growth and improve the plant's resistance to disease.",
          leavesCleaned:
              "Regularly remove and dispose of infected leaves to prevent the spread of the fungal disease.",
        ),
        requirements: ActionEntity(
          watered:
              "Water early in the day to allow leaves to dry before evening, which reduces the humidity around the plant and makes it less favorable for the fungus.",
          fertilized:
              "fertilizedAvoid excessive nitrogen, as this encourages tender growth that is more susceptible to fungal infections like black measles. Apply fertilizer according to the specific needs of the plant species and growing conditions.",
          leavesCleaned:
              "Regularly remove and dispose of infected leaves to prevent the spread of the fungal disease.",
        ),
      ),
      SolutionEntity(
        id: "0401b57e-50b1-4e67-8eea-4392ae95f4d4",
        name: "Leaf Mold",
        solution:
            "Improve air circulation around plants by spacing them properly and pruning lower leaves to reduce humidity. Water plants at the base to avoid wetting the foliage, as moist leaves encourage fungal growth. Mulching can help prevent soil splash, which can spread spores. Fungicides may be applied at the first signs of infection, especially in high-risk, humid environments, though regular cultural practices are the primary control method.",
        learnMore:
            "Caused by the fungus Passalora fulva, it typically develops in greenhouse conditions or during periods of prolonged moisture. Leaf mold is characterized by pale yellow spots on the upper leaf surfaces, which gradually turn brown or gray. On the underside, a velvety, olive-green or brown mold forms. As the disease progresses, infected leaves may wither, curl, and drop, reducing plant vitality and yield.",
        actions: ActionEntity(
          watered:
              "Water the plants at the base to prevent moisture from collecting on the leaves, which promotes fungal growth.",
          fertilized:
              "Apply a balanced fertilizer to promote healthy growth, which helps the plant resist infection.",
          leavesCleaned:
              "Remove and dispose of infected leaves to limit the spread of the disease and reduce the fungal spores in the environment.",
        ),
        requirements: ActionEntity(
          watered:
              "Keeping the foliage dry is key to preventing the spread of leaf mold. Water in the morning so that any moisture on the leaves can dry off during the day, reducing the risk of fungal infection.",
          fertilized:
              "Avoid excessive nitrogen, as it encourages rapid, soft growth that is more susceptible to fungal diseases like leaf mold. Follow the recommended application rate to prevent over-fertilizing, which can stress the plant.",
          leavesCleaned:
              "Regularly inspect tree leaves for signs of leaf mold and remove affected leaves immediately.",
        ),
      ),
      SolutionEntity(
        id: "cac158e1-a34d-4912-822e-3789e9dbc409",
        name: "Spider Mites",
        solution:
            """When you see spider mites (recognisable from silk webbing on top of the leaves), remove the affected leaves. Flush the plant thoroughly with a mixture of alcohol and soap. Repeat this treatment several times a week or use a natural product like CANNACURE to control the pest. Or when treatment with a water based product is no longer desired remove the webs with a vacuum cleaner.
To minimise the risk and rapid spread of spider mite infestations, try to keep the temperature lower (<25°C) and humidity higher (>60%), since this will slow the rate of reproduction. Higher humidity is also needed for the predators of the spider mite. Keep your growing areas clean and remove all leaf litter. Adequate irrigation is important, because water-stressed plants are more likely to suffer damage. CANNACURE can be sprayed on the plant to prevent spider mite.
""",
        learnMore:
            """Spider mites usually spin a silk webbing. When spider mites infest plant leaves, they damage the plant tissue leaving yellowing and dead spots that coalesce until eventually the entire leaf is affected. The leaf will turn yellow, wilt and finally be shed. 
The first visible symptoms will be small yellowish or whitish specks, mainly around the midrib and larger veins of the leaves. If these spots grow bigger and merge, the empty cells give some areas of the leaf a whitish or silvery-transparent appearance.
""",
        actions: ActionEntity(
          watered:
              "Water plants regularly to maintain healthy growth and reduce stress, as stressed plants are more susceptible to spider mite infestations.",
          fertilized:
              "Apply a balanced fertilizer to strengthen plant health, as healthy plants are more resistant to spider mite damage.",
          leavesCleaned:
              "Regularly inspect plants for spider mites and remove infected leaves or clusters to reduce their spread.",
        ),
        requirements: ActionEntity(
          watered:
              "Use deep watering techniques to ensure that the plant receives adequate moisture and avoid allowing the soil to dry out too much. Spider mites thrive in dry conditions, so maintaining proper soil moisture and humidity around the plant can help deter them.",
          fertilized:
              "Apply the fertilizer according to the plant’s specific requirements and growing conditions. Avoid over-fertilizing, as excessive nitrogen can lead to lush, soft growth, which is more attractive to spider mites.",
          leavesCleaned:
              "Inspect leaves carefully for the characteristic stippling, webbing, or visible mites (which may appear as tiny moving dots on the undersides of leaves). Remove heavily affected leaves to limit the spread of the mites. ",
        ),
      ),
      SolutionEntity(
        id: "06a807b2-a25f-42fd-9829-9f79a9d702d1",
        name: "Mosaic Virus",
        solution:
            "To manage mosaic virus, remove and destroy any infected plants immediately to prevent the virus from spreading. Regularly disinfect gardening tools, as the virus can persist on surfaces and spread to other plants. Controlling insect vectors, especially aphids and thrips, is critical, as they transmit the virus between plants; consider using insecticidal soaps or natural predators. Practice crop rotation and avoid planting susceptible plants in the same area each year.",
        learnMore:
            """Mosaic, plant disease caused by various strains of several hundred viruses.  The mosaic virus is a parasite that destroys plants, gardens, and crops down to their molecular level. Once a plant contracts the mosaic virus, the infected plant can then spread the virus to other plants and even affect an entire harvest if left untreated.

Mosaic symptoms are variable but commonly include irregular leaf mottling (light and dark green or yellow patches or streaks). Leaves are commonly stunted, curled, or puckered; veins may be lighter than normal or banded with dark green or yellow. Mosaic symptoms may be masked or latent, especially at temperatures above 27 °C (81 °F), and are sometimes confused with nutrient deficiency or herbicide injury. The causal viruses are spread by aphids and other insects, mites, fungi, nematodes, and contact; pollen and seeds can carry the infection as well.
""",
        actions: ActionEntity(
          watered:
              "Water at the base of the plant to avoid wetting the leaves, which can spread the virus.",
          fertilized:
              "Apply a balanced fertilizer to ensure the plant stays strong and healthy, although this will not cure the virus, it can help with overall plant vigor.",
          leavesCleaned:
              "Remove infected leaves and any plant material showing symptoms to prevent further spread of the virus.",
        ),
        requirements: ActionEntity(
          watered:
              "Watering in the morning allows any moisture on the leaves to dry quickly, reducing the likelihood of fungal or viral infections. Avoid overhead watering, as it increases the risk of contamination from plant to plant, particularly with viral diseases.",
          fertilized:
              "Healthy trees may better resist the effects of the virus, but the virus itself cannot be cured by fertilization. Over-fertilizing or using high-nitrogen fertilizers may result in soft, vulnerable growth that is more susceptible to further damage.",
          leavesCleaned:
              "Regularly inspect plants for symptoms of mosaic virus, such as mottled or distorted leaves.",
        ),
      ),
    ];
  }

  SolutionEntity? getSolution(String id) {
    try {
      return state.firstWhere(
        (solution) => solution.id == id,
      );
    } catch (e) {
      return null; // Returns null if no solution is found
    }
  }
}
