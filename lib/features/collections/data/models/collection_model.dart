import 'package:isar/isar.dart';

import '../../domain/entities/collection_entity.dart';

part 'collection_model.g.dart';

@collection
class CollectionModel{

  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String id; // id de la API

  late String name;
  late String series;
  late int total;

  late String releaseDate;

  late String symbolUrl;
  late String logoUrl;

  bool isDownloaded = false;

  CollectionModel();
}

extension CollectionModelMapper on CollectionModel {
  CollectionEntity toEntity() {
    return CollectionEntity(
      id: id,
      name: name,
      series: series,
      total: total,
      releaseDate: releaseDate,
      symbolUrl: symbolUrl,
      logoUrl: logoUrl,
      isDownloaded: isDownloaded,
    );
  }
}
