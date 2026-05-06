import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../cards/presentation/pages/cards_page.dart';
import '../../domain/entities/collection_entity.dart';

class CollectionCard extends StatelessWidget{
  final CollectionEntity collection;
  final VoidCallback onDownload;
  final bool isDownloading;
  final VoidCallback? onOpen;

  const CollectionCard({
    super.key,
    required this.collection,
    required this.onDownload,
    required this.isDownloading,
    required this.onOpen,
});

  @override

  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [


            Image.network(
              collection.symbolUrl,
              width: 40,
              height: 40,
            ),

            const SizedBox(width: 12),


            Expanded(
              child: Text(
                collection.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            if (isDownloading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )

              else if (collection.isDownloaded)
                IconButton(
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  onPressed: onOpen,
                )

              else
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: onDownload,
                )
          ],
        ),
      ),
    );
  }



}