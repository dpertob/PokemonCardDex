import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:pokemon_card_dex/features/collection_cards/domain/entities/collection_card_entity.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/card_entity.dart';
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
            Image.network(
              provider.card.imageLarge ?? provider.card.imageSmall ?? "",
              fit: BoxFit.contain,
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
                      Text(
                        "Copies: $ownedCopies",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showEditCopiesDialog(context, ownedCopies);
                        },
                        child: const Text("Edit")
                      )
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



