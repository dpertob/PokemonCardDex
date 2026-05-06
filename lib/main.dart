import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_card_dex/features/cards/domain/usecases/get_cards_by_set.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';
import 'package:provider/provider.dart';

import 'core/database/isar_instance.dart';

// DATA
import 'core/injection_container.dart';
import 'features/collections/data/datasources/collections_local_datasource.dart';
import 'features/collections/data/datasources/collections_remote_datasource.dart';
import 'features/collections/data/repositories/collections_repository_impl.dart';

// DOMAIN
import 'features/collections/domain/usecases/download_collection.dart';
import 'features/collections/domain/usecases/get_collections.dart';

// UI
import 'features/collections/presentation/pages/collections_page.dart';
import 'features/collections/presentation/state/collections_provider.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await IsarInstance.init();
  await initDependencies();

  runApp(const MyApp());
}




// TODO: Mover todo esto a injection_container.dart usando Riverpod

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CollectionsProvider(
        getCollections: sl(),
        downloadCollection: sl(),
      ),
      child: const MaterialApp(
        home: CollectionsPage(),
      ),
    );
  }
}