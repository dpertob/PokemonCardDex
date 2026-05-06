import '../repository/collections_repository.dart';

class DownloadCollection {
  final CollectionsRepository repository;

  DownloadCollection(this.repository);

  Future<void> call(String collectionId) {
    return repository.downloadCollection(collectionId);

  }


}