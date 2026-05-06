import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_card_dex/features/collection_cards/domain/usecases/get_collection_card.dart';
import '../../../collection_cards/domain/usecases/get_collection_owned.dart';
import '../../../collections/domain/entities/collection_entity.dart';
import '../../../collections/domain/usecases/get_collection_by_api_id.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/usecases/get_cards_by_set.dart';

class CardsProvider extends ChangeNotifier {
  final GetCardsBySet getCardsBySet;
  final GetCollectionOwned getCollectionOwned;
  final GetCollectionByApiId getCollectionByApiId;
  final String setId;

  CardsProvider({
    required this.getCardsBySet,
    required this.getCollectionOwned,
    required this.getCollectionByApiId,
    required this.setId,
  });

  List<CardEntity> cards = [];
  CollectionEntity? collection;
  int owned = 0;
  int total = 0;
  double percentage = 0.0;

  bool isLoading = false;
  bool hasError = false;

  Future<void> loadCards() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      cards = await getCardsBySet(setId);
      collection = await getCollectionByApiId(setId);

      if (cards.isEmpty || collection == null) {
        hasError = true;
        isLoading = false;
        notifyListeners();
        return;
      }

      owned = await getCollectionOwned(setId);
      total = collection?.total ?? 0;

      if (total != 0){
        percentage = owned/total * 100;
      } else {
        percentage = 0.0;
      }

    } catch (e) {
      debugPrint("Error loading cards: $e");
      hasError = true;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadOwned() async {
    owned = await getCollectionOwned(setId);

    if (total != 0){
      percentage = owned/total * 100;
    } else {
      percentage = 0.0;
    }

    notifyListeners();
  }

}