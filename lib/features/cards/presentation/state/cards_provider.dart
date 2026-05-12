import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../../collection_cards/domain/usecases/get_collection_card.dart';
import '../../../collection_cards/domain/usecases/get_collection_owned.dart';
import '../../../collection_cards/domain/usecases/update_collection_card.dart';
import '../../../collections/domain/entities/collection_entity.dart';
import '../../../collections/domain/usecases/get_collection_by_api_id.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/usecases/get_cards_by_set.dart';

class CardsProvider extends ChangeNotifier {
  final GetCardsBySet getCardsBySet;
  final GetCollectionOwned getCollectionOwned;
  final GetCollectionByApiId getCollectionByApiId;
  final UpdateCollectionCard updateCollectionCard;
  final String setId;

  CardsProvider({
    required this.getCardsBySet,
    required this.getCollectionOwned,
    required this.getCollectionByApiId,
    required this.updateCollectionCard,
    required this.setId,
  });

  List<CardEntity> cards = [];
  Map<String, int> ownedCopies = {};

  int currentIndex = 0;

  String query = '';

  CollectionEntity? collection;
  int owned = 0;
  int total = 0;
  double percentage = 0.0;

  bool isLoading = false;
  bool hasError = false;


  bool get hasNext =>
      currentIndex < filteredCards.length - 1;

  bool get hasPrevious =>
      currentIndex > 0;


  CardEntity get currentCard {
    if (filteredCards.isEmpty) {
      return cards.first;
    }

    if (currentIndex >= filteredCards.length) {
      currentIndex = filteredCards.length - 1;
    }

    return filteredCards[currentIndex];
  }

  List<CardEntity> get filteredCards {
    if (query.isEmpty) return cards;

    return cards.where((card) {
      return card.name
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
  }



  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextCard() {
    if (currentIndex < filteredCards.length - 1){
      currentIndex++;
      notifyListeners();
    }
  }

  void previousCard() {
    if (currentIndex > 0) {
      currentIndex--;
      notifyListeners();
    }
  }

  void updateQuery(String value) {
    query = value;
    currentIndex = 0;
    notifyListeners();
  }

  Future<void> loadCards() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      cards = await getCardsBySet(setId);
      collection = await getCollectionByApiId(setId);

      if (cards.isEmpty || collection == null) {
        hasError = true;
        return;
      }

      owned = await getCollectionOwned(setId);
      total = collection?.total ?? 0;

      percentage = total != 0 ? owned / total * 100 : 0;

    } catch (e) {
      debugPrint("Error loading cards: $e");
      hasError = true;
    } finally {

      currentIndex = 0;
      ownedCopies.clear();
      query = '';

      isLoading = false;
      notifyListeners();
    }
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


  int getOwnedCopies(String cardId) {
    return ownedCopies[cardId] ?? 0;
  }

  Future<void> updateCopies(String cardId, int value) async {
    await updateCollectionCard(cardId, value);

    ownedCopies[cardId] = value;
    notifyListeners();
  }

}