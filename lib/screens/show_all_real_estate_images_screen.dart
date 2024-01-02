import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

//Widgets
import '../widgets/my_back_icon.dart';

class ShowAllRealEstateImages extends StatefulWidget {
  final List<String> realStateImageUrl;

  ShowAllRealEstateImages({required this.realStateImageUrl});

  @override
  State<ShowAllRealEstateImages> createState() =>
      _ShowAllRealEstateImagesState();
}

class _ShowAllRealEstateImagesState extends State<ShowAllRealEstateImages> {
  //Cache Manager
  static final custonCachedManager = CacheManager(
    Config(
      'realEstateImageUrl',
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 100,
    ),
  );

  final pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            children: [
              for (int i = 0; i < widget.realStateImageUrl.length; i++)
                CachedNetworkImage(
                  cacheManager: custonCachedManager,
                  imageUrl: widget.realStateImageUrl[i],
                  height: 60,
                  width: 60,
                  placeholder: (context, url) => Image.asset(
                    'assets/noimage.png',
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/noimage.png',
                  ),
                ),
            ],
          ),
          MyBackIcon(),
        ],
      ),
    );
  }
}
