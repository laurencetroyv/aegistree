// import 'dart:io';

import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'diseases_provider.g.dart';

@Riverpod(keepAlive: true)
class Disease extends _$Disease {
  @override
  List<DiseaseEntity> build() {
    return [];
  }

  Future<void> addDiseases(
    QuerySnapshot<Map<String, dynamic>> diseases,
    String id,
  ) async {
    List<DiseaseEntity> diseasesList = [];

    for (final doc in diseases.docs) {
      final data = doc.data();

      try {
        final diseaseRef = storage.child("diseases/$id/${doc.id}");

        final image = await diseaseRef.getData();

        DiseaseEntity disease = DiseaseEntity(
          id: doc.id,
          name: data['name'],
          description: data['description'],
          image: image!,
          createdAt: DateTime.parse(data['createdAt']),
          createdBy: data['createdBy'],
        );

        diseasesList.add(disease);
      } catch (error) {
        print("disease provider error: ${error.toString()}");
      }
    }

    state = diseasesList;
  }

  Future<DiseaseEntity> addDisease(
    String diseaseId,
    String name,
    String description,
    Uint8List bytes,
  ) async {
    final user = ref.read(usersProvider);
    final index = checkDisease(name);
    if (index == -1) {
      final id = uuid.v4();
      final disease = DiseaseEntity(
        id: id,
        name: name,
        description: description,
        image: bytes,
        createdBy: user?.id ?? 'unknown',
        createdAt: DateTime.now(),
      );

      try {
        await db.collection('diseases').doc(disease.id).set(disease.toJson);

        final image = storage.child('diseases/${user?.id ?? 'unknown'}/$id');
        await image.putData(disease.image);
      } catch (error) {
        print(error.toString());
      }

      // syncDiseases();

      state = [...state, disease];
      return disease;
    }

    return state[index];
  }

  int checkDisease(String name) {
    return state.indexWhere((value) => value.name == name);
  }

  DiseaseEntity findById(String id) {
    return state.firstWhere((value) => value.id == id);
  }
}
