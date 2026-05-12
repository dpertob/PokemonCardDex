import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/network/image_cache_manager.dart';
import '../state/card_detail_provider.dart';
import '../state/cards_provider.dart';
import '../widgets/edit_copies_dialog.dart';

class CardDetailPage extends StatelessWidget {

  const CardDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CardsProvider>();
    final card = provider.currentCard;
    final ownedCopies = provider.getOwnedCopies(card.id);


    if (provider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 0.72,

              child: CachedNetworkImage(
                imageUrl:
                card.imageLarge ??
                card.imageSmall ??
                    "",

                fit: BoxFit.contain,

                cacheManager: ImageCacheManager.instance,

                width: double.infinity,

                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },

                errorWidget: (context, url, error) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            card.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            card.code ?? "no code found",
                            textAlign: TextAlign.center,
                            style: TextStyle(
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

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text("Código: ${card.code ?? "N/A"}"),
                  Text("Rareza: ${card.rarity ?? "Desconocida"}"),
                  Text("HP: ${card.hp ?? "-"}"),
                  Text("Tipos: ${card.types?.join(', ')}"),
                  Text("Subtipos: ${card.subtypes?.join(', ')}"),

                  const SizedBox(height: 16),

                  if (card.flavorText != null)
                    Text(
                      card.flavorText!,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: ownedCopies > 0
                            ? () {
                              context.read<CardsProvider>().updateCopies(card.id, ownedCopies - 1);
                              }
                            : null,
                        icon: const Icon(Icons.remove),
                      ),

                      GestureDetector(
                        onTap: () {
                          showEditCopiesDialog(context, ownedCopies);
                        },
                        child: Text(
                          "Copies: $ownedCopies",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          context
                              .read<CardDetailProvider>()
                              .updateCopies(ownedCopies + 1);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ]
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



