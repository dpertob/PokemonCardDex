import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/features/cards/presentation/state/cards_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/navigation/app_routes.dart';
import '../../../../core/network/image_cache_manager.dart';
import '../../domain/entities/card_entity.dart';


class PokemonCardTile extends StatelessWidget {
  final CardEntity card;
  final VoidCallback? onTap;


  const PokemonCardTile({
    super.key,
    required this.card,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,

      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: card.imageSmall ?? "",
                cacheManager: ImageCacheManager.instance,
                fit: BoxFit.cover,
                width: double.infinity,

                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                },

                errorWidget: (context, url, error) {
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