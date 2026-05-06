
import '../repository/collection_card_repository.dart';

class GetCollectionOwned {
  final CollectionCardRepository repository;

  GetCollectionOwned(this.repository);

  Future<int> call(String collectionId) {

    return repository.getCollectionOwned(collectionId);

  }


}