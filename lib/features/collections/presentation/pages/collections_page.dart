import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/features/collections/presentation/widgets/collection_card.dart';
import '../../../../core/injection_container.dart';
import '../../../cards/presentation/pages/cards_page.dart';
import '../../../cards/presentation/state/cards_provider.dart';
import 'package:provider/provider.dart';
import '../state/collections_provider.dart';

class CollectionsPage extends StatefulWidget {

  const CollectionsPage({
    super.key,
  });

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CollectionsProvider>().loadCollections();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CollectionsProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Colecciones')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: provider.collections.length,
            itemBuilder: (context, index) {
              final collection = provider.collections[index];

              return CollectionCard(
                collection: collection,
                isDownloading: provider.downloading.contains(collection.id),
                onDownload: () async {
                  await provider.download(collection.id);
                },
                onOpen: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider(
                        create: (_) => CardsProvider(
                          setId: collection.id,
                          getCardsBySet: sl(),
                          getCollectionOwned: sl(),
                          getCollectionByApiId: sl(),
                        )..loadCards(),
                        child: CardsPage(
                          collectionId: collection.id,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
    );
  }
}