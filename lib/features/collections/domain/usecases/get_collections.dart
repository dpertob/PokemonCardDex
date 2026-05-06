import '../entities/collection_entity.dart';
import '../repository/collections_repository.dart';

class GetCollections {
  final CollectionsRepository repository;

  GetCollections(this.repository);

  Future<List<CollectionEntity>> call() {
    return repository.getCollections();
  }
}