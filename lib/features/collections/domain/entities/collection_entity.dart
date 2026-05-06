class CollectionEntity {

  final String id; // collection's api's internal ID
  final String name;
  final String series;
  final int total;
  //final String ptcgoCode
  final String releaseDate;
  final String symbolUrl; //url del símbolo, ambos vienen de "images"
  final String logoUrl; //url del logo

  final bool isDownloaded;

  CollectionEntity({
    required this.id,
    required this.name,
    required this.series,
    required this.total,
    required this.releaseDate,
    required this.symbolUrl,
    required this.logoUrl,

    required this.isDownloaded,
  });
}