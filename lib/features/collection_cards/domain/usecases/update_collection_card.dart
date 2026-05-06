import 'package:pokemon_card_dex/features/cards/domain/repository/cards_repository.dart';

import '../repository/collection_card_repository.dart';

class UpdateCollectionCard {
  final CollectionCardRepository repository;
  final CardsRepository cardRepository;

  UpdateCollectionCard(this.repository, this.cardRepository);

  Future<void> call(String cardId, int owned) async {

    final card = await cardRepository.getCardById(cardId);

    if (card == null){
      throw Exception("Card not found for id: $cardId");
    }


    await repository.updateCollectionCard(
        cardId,
        owned,
        card.setId,
        card.name,
        card.imageSmall ?? "",
        card.code ?? "",
    );


  }


}
