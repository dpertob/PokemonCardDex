class CardEntity {

  final String id;                              // id de la API
  final String name;                            // Nombre de la carta
  final String supertype;                       // Tipo de carta (Pokemon/Energy/Trainer)

  final List<String>? subtypes;                 // Subtipos de la carta (Basic/Stage X/EX/Mega/Rapid Strike)

  final String setId;

  final int? hp;                                // Vida de la carta (si tiene)
  final List<String>? types;                    // Tipo elemental de la carta (Agua, Tierra, etc...)
  //final String evolvesFrom;                   // De qué pokémon evoluciona
  //final List<String> evolvesTo;               // A qué pokémon evoluciona
  //final List<String> rules;                   // Recuadros de regla

  // ancientTrait (hash)
  //abilities list(hash)
  //attack list (hash)
  //weaknesses list(hash)
  //resistances list(hash)

  //final List<String> retreatCost;             // conjunto de energías en el coste de retirada
  final int? convertedRetreatCost;              // número del coste de retirada

  //set (hash)

  final String? artist;                         // Artista de la carta
  final String? rarity;                         // Rareza de la carta

  final String? flavorText;                     // Descripción del pokemon de la carta
  // List<int> nationalPokedexNumbers;

  //legalities (hash)

  //final String regulationMark

  final String? imageSmall;
  final String? imageLarge;

  final String? code;
  //tcgplayer hash
  //cardmarket hash

  CardEntity({
    required this.id,
    required this.name,
    required this.supertype,
    required this.setId,

    this.subtypes,
    this.hp,
    this.types,
    this.convertedRetreatCost,
    this.artist,
    this.rarity,
    this.flavorText,
    this.imageSmall,
    this.imageLarge,
    this.code,

  });
}