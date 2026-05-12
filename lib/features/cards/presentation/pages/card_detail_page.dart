import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/network/image_cache_manager.dart';
import '../state/card_detail_provider.dart';
import '../widgets/edit_copies_dialog.dart';

class CardDetailPage extends StatelessWidget {

  const CardDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<CardDetailProvider>();

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final ownedCopies = provider.collectionCard?.ownedCopies ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.card.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: provider.card.imageLarge ?? provider.card.imageSmall ?? "",
              fit: BoxFit.contain,
              cacheManager: ImageCacheManager.instance,
              width: double.infinity,

              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(32),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),

              errorWidget: (context, url, error) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          provider.card.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          provider.card.code ?? "no code found",
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
              }
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.card.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text("Código: ${provider.card.code ?? "N/A"}"),
                  Text("Rareza: ${provider.card.rarity ?? "Desconocida"}"),
                  Text("HP: ${provider.card.hp ?? "-"}"),
                  Text("Tipos: ${provider.card.types?.join(', ')}"),
                  Text("Subtipos: ${provider.card.subtypes?.join(', ')}"),

                  const SizedBox(height: 16),

                  if (provider.card.flavorText != null)
                    Text(
                      provider.card.flavorText!,
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
                              context
                                .read<CardDetailProvider>()
                                .updateCopies(ownedCopies - 1);
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



