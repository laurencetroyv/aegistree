import 'package:flutter/services.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'leafs_provider.g.dart';

@Riverpod(keepAlive: true)
class Leafs extends _$Leafs {
  @override
  List<LeafEntity> build() {
    return [];
  }

  Future<void> addLeafs(
    QuerySnapshot<Map<String, dynamic>> leafs,
    String id,
  ) async {
    List<LeafEntity> leafList = [];
    for (final doc in leafs.docs) {
      final data = doc.data();

      try {
        final leafsRef = storage.child("leafs/$id/${doc.id}");

        final image = await leafsRef.getData();

        final leaf = LeafEntity(
          id: doc.id,
          type: data['type'],
          accuracy: data['accuracy'],
          image: image!,
          createdAt: DateTime.parse(data['createdAt']),
          createdBy: data['createdBy'],
        );

        leafList.add(leaf);
      } catch (error) {
        print("leafs provider error: ${error.toString()}");
      }
    }

    state = leafList;
  }

  Future<void> addLeaf(
    String diseaseID,
    Uint8List image,
    double accuracy,
  ) async {
    final user = ref.read(usersProvider);
    final leaf = LeafEntity(
      id: uuid.v4(),
      type: diseaseID,
      image: image,
      accuracy: accuracy,
      createdBy: user?.id ?? 'unknown',
      createdAt: DateTime.now(),
    );

    try {
      await db.collection('leafs').doc(leaf.id).set(leaf.toJson);

      final leafsRef = storage.child(
        "leafs/${user?.id ?? 'unknown'}/${leaf.id}",
      );

      await leafsRef.putData(leaf.image);
    } catch (error) {
      print(error.toString());
    }

    state = [...state, leaf];
  }

  List<LeafEntity> getLeafsByDisease(String id) {
    return state.where((leaf) => leaf.type == id).toList();
  }
}
