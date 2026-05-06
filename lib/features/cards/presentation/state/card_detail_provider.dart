import 'package:flutter/cupertino.dart';
import 'package:pokemon_card_dex/features/cards/domain/entities/card_entity.dart';
import 'package:pokemon_card_dex/features/collection_cards/domain/usecases/update_collection_card.dart';

import '../../../collection_cards/domain/entities/collection_card_entity.dart';
import '../../../collection_cards/domain/usecases/get_collection_card.dart';

class CardDetailProvider extends ChangeNotifier {
  final GetCollectionCard getCollectionCard;
  final UpdateCollectionCard updateCollectionCard;
  final CardEntity card;

  CollectionCardEntity? collectionCard;
  bool isLoading = true;

  CardDetailProvider({
    required this.getCollectionCard,
    required this.updateCollectionCard,
    required this.card,
  });

  Future<void> load() async {
    collectionCard = await getCollectionCard(card.id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateCopies(int value) async {
    try {
      await updateCollectionCard(
        card.id,
        value,
      );

      collectionCard = await getCollectionCard(card.id);
    } catch (e) {
      debugPrint("Error updating copies: $e");
    }

    notifyListeners();
  }

}