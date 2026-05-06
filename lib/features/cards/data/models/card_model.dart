import 'package:isar/isar.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';

import '../../domain/entities/card_entity.dart';

part 'card_model.g.dart';

@collection
class CardModel{

  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String id;                         // id de la API
  late String setId;                      // id del Set (para Isar, no viene de la API)
  late String name;                       // Nombre de la carta
  late String supertype;                  // Tipo de carta (Pokemon/Energy/Trainer)

  late List<String> subtypes;             // Subtipos de la carta (Basic/Stage X/EX/Mega/Rapid Strike)

  int? hp;                                // Vida de la carta (si tiene)
  late List<String> types;                // Tipo elemental de la carta (Agua, Tierra, etc...)
  //late String evolvesFrom;              // De qué pokémon evoluciona
  //late List<String> evolvesTo;          // A qué pokémon evoluciona
  //late List<String> rules;              // Recuadros de regla

  // ancientTrait (hash)
  //abilities list(hash)
  //attack list (hash)
  //weaknesses list(hash)
  //resistances list(hash)

  //late List<String> retreatCost;        // conjunto de energías en el coste de retirada
  int? convertedRetreatCost;              // número del coste de retirada

  //set (hash)

  String? artist;                         // Artista de la carta
  String? rarity;                         // Rareza de la carta

  String? flavorText;                     // Descripción del pokemon de la carta
  // List<int> nationalPokedexNumbers;

  //legalities (hash)

  //late String regulationMark

  late String imageSmall;
  late String imageLarge;

  late String code;

  //tcgplayer hash
  //cardmarket hash


  CardModel();




  factory CardModel.fromApi(PokemonCard card, String setId) {
    return CardModel()
      ..id = card.id
      ..setId = setId
      ..name = card.name
      ..supertype = card.supertype.type
      ..subtypes = card.subtypes.map((e) => e.type).toList()
      ..hp = card.hp != null ? int.tryParse(card.hp!) : null
      ..types = card.types.map((e) => e.type).toList()
      ..convertedRetreatCost = card.convertedRetreatCost
      ..artist = card.artist
      ..rarity = card.rarity
      ..flavorText = card.flavorText
      ..imageSmall = card.images.small
      ..imageLarge = card.images.large
      ..code = "${card.set.ptcgoCode ?? "no code"} ${card.number}";
  }
}

extension CardModelMapper on CardModel {
  CardEntity toEntity() {
    return CardEntity(
      id: id,
      name: name,
      supertype: supertype,
      subtypes: subtypes,
      setId: setId,
      hp: hp,
      types: types,
      convertedRetreatCost: convertedRetreatCost,
      artist: artist,
      rarity: rarity,
      flavorText: flavorText,
      imageSmall: imageSmall,
      imageLarge: imageLarge,
      code: code,
    );
  }
}

