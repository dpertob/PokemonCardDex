class CollectionCardEntity {

  // Relaciones con los modelos de carta y colección de la API
  final String collectionId;
  final String cardId;

  // Datos sobre posesión de la carta
  final int ownedCopies;

  // Fallback para cuando las referencias no existan
  final String cachedName;
  final String cachedCode;
  final String cachedImageUrl; // Versión small

  const CollectionCardEntity({

    required this.collectionId,
    required this.cardId,
    required this.ownedCopies,
    required this.cachedName,
    required this.cachedCode,
    required this.cachedImageUrl,

  });
}