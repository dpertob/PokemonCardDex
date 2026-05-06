import '../../domain/entities/card_entity.dart';
import '../../domain/repository/cards_repository.dart';
import '../datasources/cards_local_datasource.dart';
import '../datasources/cards_remote_data_source.dart';
import '../models/card_model.dart';

class CardsRepositoryImpl implements CardsRepository {
  final CardsRemoteDataSource remote;
  final CardsLocalDataSource local;

  CardsRepositoryImpl(this.remote, this.local);

  @override
  Future<List<CardEntity>> getCardsBySet(String setId) async {
    final localCards = await local.getCardsBySet(setId);
    return localCards.map((e) => e.toEntity()).toList();
  }

  @override
  Future<CardEntity?> getCardById(String cardId) async {
    final card = await local.getCardById(cardId);

    if (card == null){
      return null;
    }

    return card.toEntity();
  }
}


