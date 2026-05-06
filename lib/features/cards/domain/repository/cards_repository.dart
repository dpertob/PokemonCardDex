import 'package:pokemon_card_dex/features/cards/domain/entities/card_entity.dart';

abstract class CardsRepository {
  Future<List<CardEntity>> getCardsBySet(String setId);

  Future<CardEntity?> getCardById(String cardId);
}