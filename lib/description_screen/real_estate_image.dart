import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

//Screens
import '../screens/show_all_real_estate_images_screen.dart';

//Widgets
import '../widgets/custom_page_route_widget.dart';
import '../widgets/my_back_icon.dart';

class RealEstateImage extends StatefulWidget {
  final List<String> realStateImageUrl;

  RealEstateImage({required this.realStateImageUrl});

  @override
  State<RealEstateImage> createState() => _RealEstateImageState();
}

class _RealEstateImageState extends State<RealEstateImage> {
  //Cache Manager
  static final custonCachedManager = CacheManager(
    Config(
      'realEstateImageUrl',
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 100,
    ),
  );

  String imageToShow = '';

  @override
  void initState() {
    super.initState();

    imageToShow = widget.realStateImageUrl[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 400,
      width: size.width,
      child: Stack(
        children: [
          //PREVIEW FIRST TWO IMAGES
          realEstateImages(size: size.width),
          MyBackIcon(),
          //SHOW ALL REAL ESTATE IMAGES
          showImagesContainer(),
        ],
      ),
    );
  }

  Widget realEstateImages({required double size}) {
    return CachedNetworkImage(
      cacheManager: custonCachedManager,
      imageUrl: imageToShow,
      height: 400,
      width: size,
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

  Widget showImagesContainer() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0;
              i <
                  (widget.realStateImageUrl.length > 3
                      ? 3
                      : widget.realStateImageUrl.length);
              i++)
            allImagesContainer(
              index: i,
              imageUrl: widget.realStateImageUrl[i],
            ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget allImagesContainer({
    required String imageUrl,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          if (index >= 0 && index <= 1) {
            setState(() {
              imageToShow = imageUrl;
            });
          }

          if (index > 1) {
            Navigator.of(context).push(
              CustomPageRouteWidget(
                child: ShowAllRealEstateImages(
                    realStateImageUrl: widget.realStateImageUrl),
              ),
            );
          }
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13.0),
            child: Stack(
              children: [
                CachedNetworkImage(
                  cacheManager: custonCachedManager,
                  imageUrl: imageUrl,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    'assets/noimage.png',
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/noimage.png',
                    fit: BoxFit.cover,
                  ),
                ),
                if (index > 1)
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      color: Colors.black38,
                    ),
                    child: Center(
                      child: Text(
                        '+${widget.realStateImageUrl.length - 2}',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
