import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/network/image_cache_manager.dart';
import '../state/cards_provider.dart';

class CollectionHeader extends StatelessWidget {
  final CardsProvider provider;

  const CollectionHeader({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {

    if (provider.collection == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          SizedBox(
            height: 120,
            child: CachedNetworkImage(
              imageUrl: provider.collection?.logoUrl ?? "",
              fit: BoxFit.contain,
              cacheManager: ImageCacheManager.instance,

              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(32),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),

              errorWidget: (context, url, error) {
                return Center(
                  child: Text(
                    provider.collection?.name ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "${provider.owned} / ${provider.total} cards",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            "${provider.percentage.toStringAsFixed(1)}% completed",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),

          LinearProgressIndicator(
            value: provider.percentage / 100,
          ),
        ],
      ),
    );
  }
}