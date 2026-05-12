import 'package:flutter/material.dart';

import '../../domain/entities/collection_entity.dart';
import '../../domain/usecases/get_collections.dart';
import '../../domain/usecases/download_collection.dart';

class CollectionsProvider extends ChangeNotifier {
  final GetCollections getCollections;
  final DownloadCollection downloadCollection;
  Set<String> downloading = {};


  CollectionsProvider({
    required this.getCollections,
    required this.downloadCollection,
  });

  List<CollectionEntity> collections = [];
  bool isLoading = false;

  Future<void> loadCollections() async {
    isLoading = true;
    notifyListeners();

    try {
      collections = await getCollections();
    } catch (e) {
      debugPrint("Error loading collections: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> download(String collectionId) async {
    downloading = {...downloading, collectionId};
    notifyListeners();

    try{
      await downloadCollection(collectionId);

      final index = collections.indexWhere((c) => c.id == collectionId);

      if (index != -1) {
        final updated = collections[index].copyWith(isDownloaded: true);

        collections[index] = updated;
      }
    } catch (e) {
      debugPrint("Error downloading collection: $e");
    } finally {
      downloading = {...downloading}..remove(collectionId);
      notifyListeners();
    }
  }
}