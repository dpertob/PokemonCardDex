import 'dart:developer' as console;

import '../../domain/entities/collection_entity.dart';
import '../../domain/repository/collections_repository.dart';
import '../datasources/collections_local_datasource.dart';
import '../datasources/collections_remote_datasource.dart';
import '../models/collection_model.dart';

class CollectionsRepositoryImpl implements CollectionsRepository {
  final CollectionsRemoteDataSource remote;
  final CollectionsLocalDataSource local;

  CollectionsRepositoryImpl(this.remote, this.local);

  @override
  Future<List<CollectionEntity>> getCollections() async {
    final hasLocal = await local.hasCollections();

    if (hasLocal) {
      final localCollections = await local.getCollections();

      console.log("Obteniendo info de local");

      return localCollections.map((e) => e.toEntity()).toList();
    }

    final remoteCollections = await remote.getCollections();

    await local.saveCollections(remoteCollections);

    console.log("Obteniendo info de API");

    return remoteCollections.map((e) => e.toEntity()).toList();
  }


  @override
  Future<void> downloadCollection(String collectionId) async {
    console.log("➡️ DOWNLOAD START: $collectionId");

    final cards = await remote.getCardsBySet(collectionId);

    console.log("📦 CARDS DESCARGADAS: ${cards.length}");
    await local.saveCards(collectionId, cards);

    console.log("💾 GUARDANDO EN ISAR...");
    await local.markAsDownloaded(collectionId);

    console.log("✅ DOWNLOAD COMPLETED");
  }

  @override
  Future<CollectionEntity> getCollectionByApiId(String collectionId) async {
    final collection = await local.getCollectionByApiId(collectionId);

    return collection.toEntity();
  }

}