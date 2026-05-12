import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../core/injection_container.dart';
import '../../domain/entities/card_entity.dart';
import '../state/card_detail_provider.dart';
import 'card_detail_page.dart';

class CardDetailPager extends StatefulWidget {

  final List<CardEntity> cards;
  final int initialIndex;

  const CardDetailPager({
    super.key,
    required this.cards,
    required this.initialIndex,
  });


  @override
  State<CardDetailPager> createState() => _CardDetailPagerState();
}


class _CardDetailPagerState extends State<CardDetailPager> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();

    controller = PageController(
      initialPage: widget.initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: widget.cards.length,
      itemBuilder: (context, index) {
        final card = widget.cards[index];

        return ChangeNotifierProvider(
          create: (_) => CardDetailProvider(
            getCollectionCard: sl(),
            updateCollectionCard: sl(),
            card: card,
          )..load(),
          child: const CardDetailPage(),
        );
      },
    );
  }
}