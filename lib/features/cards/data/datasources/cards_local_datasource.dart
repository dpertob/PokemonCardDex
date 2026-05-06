import 'package:isar/isar.dart';

import '../../../../core/database/isar_instance.dart';
import '../models/card_model.dart';

class CardsLocalDataSource {

  final isar = IsarInstance.isar;

  Future<List<CardModel>> getCardsBySet(String setId) async {
    return await isar.cardModels
      .filter()
      .setIdEqualTo(setId)
      .findAll();
  }


  Future<CardModel?> getCardById(String cardId) async {
    return await isar.cardModels
        .filter()
        .idEqualTo(cardId)
        .findFirst();
  }
}