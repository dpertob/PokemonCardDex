import 'dart:developer' as console;

import 'package:flutter/cupertino.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';

import '../../../cards/data/models/card_model.dart';
import '../models/collection_model.dart';

class CollectionsRemoteDataSource {

  final api;

  CollectionsRemoteDataSource(this.api);

  Future<List<CollectionModel>> getCollections() async {
    final sets = await api.getSets();
    return sets.map<CollectionModel>((set) {
        final model = CollectionModel()
          ..id = set.id
          ..name = set.name
          ..series = set.series
          ..total = set.printedTotal
          ..releaseDate = set.releaseDate
          ..symbolUrl = set.images.symbol
            ..logoUrl = set.images.logo;

        return model;
    }).toList();
  }


  Future<List<CardModel>> getCardsBySet(String setId) async {
    final List<CardModel> allCards = [];

    final paginated = PaginatedPokemonCards([], api);

    int page = 1;

    while (true) {
      await paginated.loadMoreForSet(setId, page: page);

      final newCards = paginated.cards;

      debugPrint("⬇️ PAGE $page LOADED: ${newCards.length}");

      if (newCards.isEmpty) break;

      allCards.addAll(
        newCards.map((card) => CardModel.fromApi(card, setId)),
      );

      paginated.cards.clear();

      page++;
    }

    debugPrint("📥 TOTAL CARDS API: ${allCards.length}");

    return allCards;
  }

}