import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/features/cards/presentation/state/cards_provider.dart';
import 'package:pokemon_card_dex/features/cards/presentation/widgets/pokemon_card_tile.dart';

import 'package:provider/provider.dart';
import '../../../../core/network/image_cache_manager.dart';
import '../widgets/card_search_delegate.dart';
import '../widgets/collection_header.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CardsProvider>().loadCards();
    });

  }

  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardsProvider>();

    final filtered = provider.filteredCards;

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
        title: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                provider.isLoading
                    ? 'Cargando...'
                    : provider.collection!.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              flex: 3,
              child: TextField(
                controller: searchController,
                onChanged: provider.updateQuery,
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  suffixIcon: provider.query.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      provider.updateQuery('');
                      searchController.clear();
                      FocusScope.of(context).unfocus();
                    },
                  )
                      : const Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
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
                  final card = filtered[index];
                  return PokemonCardTile(card: card);
                },
                childCount: filtered.length,
              ),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}