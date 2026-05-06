import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_card_dex/features/collection_cards/domain/usecases/get_collection_card.dart';
import 'package:pokemon_card_dex/features/collection_cards/domain/usecases/get_collection_owned.dart';
import 'package:pokemon_card_dex/features/collection_cards/domain/usecases/update_collection_card.dart';
import 'package:pokemon_card_dex/features/collections/domain/usecases/get_collection_by_api_id.dart';
import 'package:pokemon_tcg/pokemon_tcg.dart';

import '../features/cards/data/datasources/cards_local_datasource.dart';
import '../features/cards/data/datasources/cards_remote_data_source.dart';
import '../features/cards/data/repositories/cards_repository_impl.dart';
import '../features/cards/domain/repository/cards_repository.dart';
import '../features/cards/domain/usecases/get_cards_by_set.dart';

import '../features/collection_cards/data/datasources/collection_card_local_datasource.dart';
import '../features/collection_cards/data/repositories/collection_card_repository_impl.dart';
import '../features/collection_cards/domain/repository/collection_card_repository.dart';
import '../features/collections/data/datasources/collections_local_datasource.dart';
import '../features/collections/data/datasources/collections_remote_datasource.dart';
import '../features/collections/data/repositories/collections_repository_impl.dart';

import '../features/collections/domain/repository/collections_repository.dart';
import '../features/collections/domain/usecases/download_collection.dart';
import '../features/collections/domain/usecases/get_collections.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {

  // External
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<PokemonTcgApi>(
        () => PokemonTcgApi(
      client: sl(),
      apiKey: '3e411aab-f636-4f21-9f33-53599ed5d4d7',
    ),
  );

  // Datasources
  sl.registerLazySingleton<CollectionsRemoteDataSource>(
        () => CollectionsRemoteDataSource(sl<PokemonTcgApi>()),
  );

  sl.registerLazySingleton<CollectionsLocalDataSource>(
        () => CollectionsLocalDataSource(),
  );

  sl.registerLazySingleton<CardsRemoteDataSource>(
        () => CardsRemoteDataSource(),
  );

  sl.registerLazySingleton<CardsLocalDataSource>(
        () => CardsLocalDataSource(),
  );

  sl.registerLazySingleton<CollectionCardLocalDataSource>(
        () => CollectionCardLocalDataSource(),
  );

  // Repositories
  sl.registerLazySingleton<CollectionsRepository>(
        () => CollectionsRepositoryImpl(
      sl<CollectionsRemoteDataSource>(),
      sl<CollectionsLocalDataSource>(),
    ),
  );

  sl.registerLazySingleton<CardsRepository>(
        () => CardsRepositoryImpl(
      sl<CardsRemoteDataSource>(),
      sl<CardsLocalDataSource>(),
    ),
  );

  sl.registerLazySingleton<CollectionCardRepository>(
      () => CollectionCardRepositoryImpl(
        sl<CollectionCardLocalDataSource>(),
      ),
  );

  // Use cases
  sl.registerLazySingleton<GetCollections>(
        () => GetCollections(sl<CollectionsRepository>()),
  );

  sl.registerLazySingleton<DownloadCollection>(
        () => DownloadCollection(sl<CollectionsRepository>()),
  );

  sl.registerLazySingleton<GetCardsBySet>(
        () => GetCardsBySet(sl<CardsRepository>()),
  );


  sl.registerLazySingleton<GetCollectionByApiId>(
      () => GetCollectionByApiId(sl<CollectionsRepository>()),
  );

  sl.registerLazySingleton<GetCollectionOwned>(
      () => GetCollectionOwned(sl<CollectionCardRepository>()),
  );

  sl.registerLazySingleton<GetCollectionCard>(
      () => GetCollectionCard(sl<CollectionCardRepository>()),
  );

  sl.registerLazySingleton<UpdateCollectionCard>(
      () => UpdateCollectionCard(sl<CollectionCardRepository>(), sl<CardsRepository>()),
  );



}