import 'package:isar/isar.dart';

import '../../../cards/data/models/card_model.dart';
import '../../domain/entities/collection_card_entity.dart';

part 'collection_card_model.g.dart';

@collection
class CollectionCardModel {
  Id isarId = Isar.autoIncrement;

  @Index(
    composite: [CompositeIndex('cardId')],
    unique: true,
  )
  late String collectionId;

  late String cardId;

  int ownedCopies = 0;

  late String cachedName;
  late String cachedCode;

  String? cachedImageUrl;



  CollectionCardModel();


  factory CollectionCardModel.fromCard(
      CardModel card,
      String collectionId,
      ) {
    return CollectionCardModel()
      ..collectionId = collectionId
      ..cardId = card.id
      ..cachedName = card.name
      ..cachedCode = card.code
      ..cachedImageUrl = card.imageSmall;
  }

}

extension CollectionCardMapper on CollectionCardModel {
  CollectionCardEntity toEntity() {
    return CollectionCardEntity(
      collectionId: collectionId,
      cardId: cardId,
      ownedCopies: ownedCopies,
      cachedName: cachedName,
      cachedCode: cachedCode,
      cachedImageUrl: cachedImageUrl ?? "",
    );
  }
}

