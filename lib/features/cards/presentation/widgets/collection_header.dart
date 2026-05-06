import 'package:flutter/material.dart';
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

          Image.network(
            provider.collection!.logoUrl,
            width: 180,
            height: 180,
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