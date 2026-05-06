import 'package:pokemon_card_dex/features/collections/presentation/widgets/collection_card.dart';

import '../entities/collection_card_entity.dart';

abstract class CollectionCardRepository {
  Future<int> getCollectionOwned(String collectionId);
  Future<CollectionCardEntity?> getCollectionCard(String cardId);
  Future<void> updateCollectionCard(String cardId, int owned, String collectionId,
                                    String cachedName, String cachedImage, String cachedCode);
}