import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/features/collections/presentation/widgets/collection_card.dart';
import '../../../../core/navigation/app_routes.dart';
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

    final collections = context.select(
          (CollectionsProvider p) => p.collections,
    );

    final isLoading = context.select(
          (CollectionsProvider p) => p.isLoading,
    );

    final downloading = context.select(
          (CollectionsProvider p) => p.downloading,
    );



    return Scaffold(
      appBar: AppBar(title: const Text('Official Sets')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            key: const PageStorageKey("collections_list"),
            itemCount: collections.length,
            itemBuilder: (context, index) {
              final collection = collections[index];

              return CollectionCard(
                key: ValueKey(collection.id),
                collection: collection,
                isDownloading: downloading.contains(collection.id),
                onDownload: () async {
                  await context.read<CollectionsProvider>().download(collection.id);
                },
                onOpen: () {
                  Navigator.push(
                    context,
                    AppRoutes.cards(collection.id)
                  );
                },
              );
            },
          ),
    );
  }
}