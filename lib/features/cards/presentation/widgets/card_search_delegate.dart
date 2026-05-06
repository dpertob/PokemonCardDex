import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/features/cards/presentation/widgets/pokemon_card_tile.dart';

import '../../domain/entities/card_entity.dart';

class CardSearchDelegate extends SearchDelegate {
  final List<CardEntity> cards;

  CardSearchDelegate(this.cards);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context){
    final results = cards.where((card) {
      return card.name.toLowerCase().contains(
        query.toLowerCase(),
      );
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Text('No cards founds'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: results.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index){
        return PokemonCardTile(
          card: results[index],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context){
    final suggestions = query.isEmpty
        ? cards
        : cards.where((card) {
          return card.name.toLowerCase().contains(
            query.toLowerCase(),
          );
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final card = suggestions[index];

        return ListTile(
          title: Text(card.name),
          onTap: () {
            query = card.name;
            showResults(context);
          },
        );
      },
    );
  }


}