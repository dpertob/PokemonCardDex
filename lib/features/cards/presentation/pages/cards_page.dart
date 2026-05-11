import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/features/cards/presentation/state/cards_provider.dart';
import 'package:pokemon_card_dex/features/cards/presentation/widgets/pokemon_card_tile.dart';

import 'package:provider/provider.dart';
import '../widgets/card_search_delegate.dart';
import '../widgets/collection_header.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CardsProvider>().loadCards();
    });
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardsProvider>();

    if (provider.hasError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) Navigator.pop(context);
      });

      return const Scaffold(
        body: Center(child: Text("Error cargando cartas")),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          provider.isLoading
              ? 'Cargando...'
              : provider.collection!.name,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch (
                context: context,
                delegate: CardSearchDelegate(provider.cards),
              );
            },
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          :  CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CollectionHeader(provider: provider),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final card = provider.cards[index];
                return PokemonCardTile(card: card);
              },
              childCount: provider.cards.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
            ),
          ),
        ],
      ),
    );
  }
}