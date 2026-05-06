import 'package:pokemon_card_dex/features/cards/domain/entities/card_entity.dart';

import '../../data/repositories/cards_repository_impl.dart';
import '../repository/cards_repository.dart';


class GetCardsById{

  final CardsRepository repository;

  GetCardsById(this.repository);

  Future<CardEntity?> call(String cardId) {
    return repository.getCardById(cardId);
  }
}


