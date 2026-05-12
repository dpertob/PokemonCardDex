import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/image_cache_manager.dart';
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

            SizedBox(
              width: 30,
              height: 30,
              child: CachedNetworkImage(
                imageUrl: collection.symbolUrl,
                fit: BoxFit.contain,
                cacheManager: ImageCacheManager.instance,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.style),
              ),
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
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 8),
                  Text("Descargando..."),
                ],
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