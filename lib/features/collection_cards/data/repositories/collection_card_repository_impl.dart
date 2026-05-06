import 'package:pokemon_card_dex/features/collection_cards/domain/entities/collection_card_entity.dart';

import '../../domain/repository/collection_card_repository.dart';
import '../datasources/collection_card_local_datasource.dart';
import '../models/collection_card_model.dart';

class CollectionCardRepositoryImpl implements CollectionCardRepository {
  final CollectionCardLocalDataSource local;


  CollectionCardRepositoryImpl(this.local);

  @override
  Future<int> getCollectionOwned(String collectionId) async{
    final owned = await local.countOwned(collectionId);

    return owned;
  }

  @override
  Future<CollectionCardEntity?> getCollectionCard(String cardId) async{
    final card = await local.getCollectionCard(cardId);

    if (card == null){
      return null;
    }

    return card.toEntity();
  }

  @override
  Future<void> updateCollectionCard(String cardId, int owned, String collectionId,
      String cachedName, String cachedImage, String cachedCode ) async {
    await local.updateCollectionCard(cardId, owned, collectionId, cachedName, cachedImage, cachedCode);
  }
}