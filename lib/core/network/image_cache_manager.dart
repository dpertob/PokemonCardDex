import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageCacheManager {
  ImageCacheManager._();



  static final CacheManager instance = CacheManager(
    Config(
      'cardsCache',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 1000,
      repo: JsonCacheInfoRepository(databaseName: 'cardsCache_v1'),
      fileService: HttpFileService(),
    ),
  );
}