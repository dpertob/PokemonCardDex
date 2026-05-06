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

  /// ⬇️ Descargar colección
  Future<void> download(String collectionId) async {
    downloading.add(collectionId);
    notifyListeners();

    await downloadCollection(collectionId);

    downloading.remove(collectionId);
    await loadCollections();
  }
}