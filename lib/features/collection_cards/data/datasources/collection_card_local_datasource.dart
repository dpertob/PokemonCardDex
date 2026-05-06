import 'package:isar/isar.dart';
import 'package:pokemon_card_dex/features/collection_cards/data/models/collection_card_model.dart';

import '../../../../core/database/isar_instance.dart';

class CollectionCardLocalDataSource {


  final isar = IsarInstance.isar;


  Future<int> countOwned(String collectionId) async {
    return await isar.collectionCardModels
        .filter()
        .collectionIdEqualTo(collectionId)
        .ownedCopiesGreaterThan(0)
        .count();
  }

  Future<CollectionCardModel?> getCollectionCard(String cardId) async {
    final result = await isar.collectionCardModels
        .filter()
        .cardIdEqualTo(cardId)
        .findFirst();

    return result;
  }

  Future<void> updateCollectionCard(String cardId, int owned, String collectionId,
      String cachedName, String cachedImage, String cachedCode ) async {
    await isar.writeTxn(() async {
      final existing = await isar.collectionCardModels
          .filter()
          .cardIdEqualTo(cardId)
          .findFirst();

      if (owned == 0){
        if (existing != null) {
          await isar.collectionCardModels.delete(existing.isarId);
        }
        return;
      }

      if (existing != null) {
        existing.ownedCopies = owned;
        await isar.collectionCardModels.put(existing);
        return;
      }

      final newCard = CollectionCardModel()
        ..collectionId = collectionId
        ..ownedCopies = owned
        ..cardId = cardId
        ..cachedName = cachedName
        ..cachedCode = cachedCode
        ..cachedImageUrl = cachedImage;

      await isar.collectionCardModels.put(newCard);

    });
  }

}