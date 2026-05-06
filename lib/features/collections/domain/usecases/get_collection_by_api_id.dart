import '../entities/collection_entity.dart';
import '../repository/collections_repository.dart';

class GetCollectionByApiId {
  final CollectionsRepository repository;

  GetCollectionByApiId(this.repository);

  Future<CollectionEntity> call(String collectionId) {
    return repository.getCollectionByApiId(collectionId);
  }
}