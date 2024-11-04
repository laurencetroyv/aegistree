import 'dart:io';

import 'package:flutter/services.dart';

import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'leafs_provider.g.dart';

@Riverpod(keepAlive: true)
class Leafs extends _$Leafs {
  late final UserEntity _user;

  @override
  List<LeafEntity> build() {
    _user = ref.read(usersProvider)!;

    syncLeafs();

    final localLeafs = isar.leafModels.where().findAll();

    return localLeafs.map((value) {
      return LeafEntity.fromModel(value);
    }).toList();
  }

  Future<void> syncLeafs() async {
    try {
      final lastSync = isar.lastSyncModels
              .where()
              .typeEqualTo('leafs')
              .findFirst() ??
          LastSyncModel()
        ..type = 'leafs'
        ..timestamp = DateTime.fromMicrosecondsSinceEpoch(0);

      final localChanges = isar.leafModels
          .where()
          .createdAtGreaterThan(lastSync.timestamp)
          .findAll();

      for (final leaf in localChanges) {
        await db.collection('leafs').doc(leaf.uid).set(leaf.toJson);

        final leafsRef = storage.child("leafs/${_user.id}/${leaf.id}.png");

        await leafsRef.putFile(
          File.fromRawPath(Uint8List.fromList(leaf.image)),
        );
      }

      final remoteChanges = await db
          .collection('leaf')
          .where('createdBy', isEqualTo: _user.id)
          .where('createdAt',
              isGreaterThan: lastSync.timestamp.toIso8601String())
          .get();

      await isar.writeAsync((isar) async {
        for (final doc in remoteChanges.docs) {
          final data = doc.data();

          final leafsRef = storage.child("leafs/${_user.id}/${doc.id}.png");

          final image = await leafsRef.getData();

          LeafModel leaf = LeafEntity(
            id: doc.id,
            type: data['type'],
            image: image!,
            createdAt: data['createdAt'],
            createdBy: data['createdBy'],
          ).toModel
            ..id = isar.diseaseModels.autoIncrement();

          isar.leafModels.put(leaf);
        }

        lastSync.timestamp = DateTime.now();
        isar.lastSyncModels.put(lastSync);
      });

      // Update state with latest data
      final updatedLeafs = isar.leafModels.where().findAll();
      state = updatedLeafs.map((model) => LeafEntity.fromModel(model)).toList();
    } catch (error) {
      // On error, just load from local database
      final localLeafs = isar.leafModels.where().findAll();
      state = localLeafs.map((model) => LeafEntity.fromModel(model)).toList();
    }
  }

  void addLeaf(String diseaseID, Uint8List image) {
    final leaf = LeafEntity(
      id: uuid.v4(),
      type: diseaseID,
      image: image,
      createdBy: _user.id,
      createdAt: DateTime.now(),
    );

    final model = leaf.toModel..id = isar.leafModels.autoIncrement();

    isar.writeAsync((isar) {
      isar.leafModels.put(model);
    });

    try {
      db.collection('leafs').doc(leaf.id).set(leaf.toJson);
      final leafsRef = storage.child("leafs/${_user.id}/${leaf.id}.png");

      leafsRef.putFile(
        File.fromRawPath(Uint8List.fromList(leaf.image)),
      );
    } catch (error) {
      //
    }

    state = [...state, leaf];
  }

  List<LeafEntity> getLeafsByDisease(String id) {
    return state.where((leaf) => leaf.type == id).toList();
  }
}
