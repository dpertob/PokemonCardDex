import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/features/cards/presentation/state/cards_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/injection_container.dart';
import '../../../collection_cards/domain/entities/collection_card_entity.dart';
import '../../domain/entities/card_entity.dart';
import '../pages/card_detail_page.dart';
import '../state/card_detail_provider.dart';

class PokemonCardTile extends StatelessWidget {
  final CardEntity card;

  const PokemonCardTile({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
              create: (_) => CardDetailProvider(
                getCollectionCard: sl(),
                updateCollectionCard: sl(),
                card: card,
              )..load(),
              child: const CardDetailPage(),
            )
          ),
        );

        context.read<CardsProvider>().loadCards();
      },

      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                card.imageSmall ?? "",
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            card.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            card.code ?? "no code found",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}