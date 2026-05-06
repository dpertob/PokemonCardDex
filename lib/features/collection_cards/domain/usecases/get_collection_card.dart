
import 'package:pokemon_card_dex/features/collection_cards/domain/entities/collection_card_entity.dart';

import '../repository/collection_card_repository.dart';

class GetCollectionCard {
  final CollectionCardRepository repository;

  GetCollectionCard(this.repository);

  Future<CollectionCardEntity?> call(String cardId) {

    return repository.getCollectionCard(cardId);

  }


}