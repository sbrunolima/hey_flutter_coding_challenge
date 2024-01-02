import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RealEstateMapLocation extends StatelessWidget {
  final String locationUrl;

  //Cache Manager
  static final custonCachedManager = CacheManager(
    Config(
      'realEstateImageUrl',
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 100,
    ),
  );

  RealEstateMapLocation({required this.locationUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CachedNetworkImage(
      cacheManager: custonCachedManager,
      imageUrl: locationUrl,
      height: 220,
      width: size.width,
      fit: BoxFit.cover,
      placeholder: (context, url) => Image.asset(
        'assets/noimage.png',
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/noimage.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
