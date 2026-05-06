import 'package:isar/isar.dart';
import 'package:pokemon_card_dex/core/database/isar_instance.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../cards/data/models/card_model.dart';
import '../models/collection_model.dart';

class CollectionsLocalDataSource {

  final isar = IsarInstance.isar;

  Future<void> saveCollections(List<CollectionModel> collections) async {
    await isar.writeTxn(() async {
      await isar.collectionModels.putAll(collections);
    });
  }

  Future<List<CollectionModel>> getCollections() async {
    return await isar.collectionModels.where().findAll();
  }

  Future<bool> hasCollections() async {
    final count = await isar.collectionModels.count();
    return count > 0;
  }

  Future<CollectionModel> getCollectionByApiId(String id) async {
    final result = await isar.collectionModels
        .filter()
        .idEqualTo(id)
        .findFirst();

    if (result == null) {
      throw Exception("Collection not found: $id");
    }

    return result;
  }

  Future<void> markAsDownloaded(String id) async {
    final collection = await getCollectionByApiId(id);

    collection.isDownloaded = true;

    await isar.writeTxn(() async {
      await isar.collectionModels.put(collection);
    });
  }

  Future<void> saveCards(String setId, List<CardModel> cards) async {
    final collection = await getCollectionByApiId(setId);

    if (!collection.isDownloaded) {
      await isar.writeTxn(() async {
        await isar.cardModels.putAll(cards);
      });
    }
  }

}