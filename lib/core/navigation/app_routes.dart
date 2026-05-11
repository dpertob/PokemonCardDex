import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/cards/domain/entities/card_entity.dart';
import '../../features/cards/presentation/pages/card_detail_page.dart';
import '../../features/cards/presentation/pages/cards_page.dart';
import '../../features/cards/presentation/state/card_detail_provider.dart';
import '../../features/cards/presentation/state/cards_provider.dart';
import '../../features/collections/presentation/pages/collections_page.dart';
import '../../features/collections/presentation/state/collections_provider.dart';
import '../injection_container.dart';

class AppRoutes {
  static Route collections() {
    return MaterialPageRoute(
      builder: (_) => ChangeNotifierProvider(
        create: (_) => CollectionsProvider(
          getCollections: sl(),
          downloadCollection: sl(),
        )..loadCollections(),
        child: const CollectionsPage(),
      ),
    );
  }

  static Route cards(String setId) {
    return MaterialPageRoute(
      builder: (_) => ChangeNotifierProvider(
        create: (_) => CardsProvider(
          setId: setId,
          getCardsBySet: sl(),
          getCollectionOwned: sl(),
          getCollectionByApiId: sl(),
        )..loadCards(),
        child: CardsPage(),
      ),
    );
  }

  static Route cardDetails(CardEntity card) {
    return MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider(
          create: (_) => CardDetailProvider(
            getCollectionCard: sl(),
            updateCollectionCard: sl(),
            card: card,
          )..load(),
          child: const CardDetailPage(),
        ),
    );
  }
}