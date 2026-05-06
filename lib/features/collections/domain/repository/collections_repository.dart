import '../entities/collection_entity.dart';

abstract class CollectionsRepository {
  Future<List<CollectionEntity>> getCollections();

  Future<void> downloadCollection(String collectionId);

  Future<CollectionEntity> getCollectionByApiId(String collectionId);

}