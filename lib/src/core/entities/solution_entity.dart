import 'package:aegistree/src/src.dart';

class SolutionEntity {
  final String name;
  final String solution;
  final String learnMore;
  final ActionEntity actions;
  final ActionEntity requirements;

  SolutionEntity({
    required this.name,
    required this.solution,
    required this.learnMore,
    required this.actions,
    required this.requirements,
  });
}
