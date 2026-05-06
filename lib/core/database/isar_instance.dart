import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/cards/data/models/card_model.dart';
import '../../features/collection_cards/data/models/collection_card_model.dart';
import '../../features/collections/data/models/collection_model.dart';

class IsarInstance {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [CollectionModelSchema, CardModelSchema, CollectionCardModelSchema],
      directory: dir.path,
    );
  }
}