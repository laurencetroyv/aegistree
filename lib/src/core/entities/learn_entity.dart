import 'package:aegistree/src/src.dart';

class LearnEntity {
  final DiseaseEntity disease;
  final String description;
  final String symptoms;
  final String treatment;

  LearnEntity({
    required this.disease,
    required this.description,
    required this.symptoms,
    required this.treatment,
  });
}
