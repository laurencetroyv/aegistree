import 'package:flutter/services.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'diseases_provider.g.dart';

@Riverpod(keepAlive: true)
class Disease extends _$Disease {
  @override
  List<DiseaseEntity> build() {
    return [];
  }

  DiseaseEntity addDisease(String name, String description, Uint8List bytes) {
    final index = checkDisease(name);
    if (index == -1) {
      final disease = DiseaseEntity(
        id: uuid.v4(),
        name: name,
        description: description,
        image: bytes,
        createdAt: DateTime.now(),
      );

      state = [...state, disease];
      return disease;
    }

    return state[index];
  }

  int checkDisease(String name) {
    return state.indexWhere((value) => value.name == name);
  }
}
