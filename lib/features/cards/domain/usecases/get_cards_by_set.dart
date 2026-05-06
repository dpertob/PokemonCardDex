import 'package:pokemon_card_dex/features/cards/domain/entities/card_entity.dart';

import '../../data/repositories/cards_repository_impl.dart';
import '../repository/cards_repository.dart';


class GetCardsBySet{

  final CardsRepository repository;

  GetCardsBySet(this.repository);

  Future<List<CardEntity>> call(String setId) {
    return repository.getCardsBySet(setId);
  }
}


