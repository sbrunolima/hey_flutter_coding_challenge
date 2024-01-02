import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdvertisementContainer extends StatelessWidget {
  //Cache Manager
  static final custonCachedManager = CacheManager(
    Config(
      'realEstateImageUrl',
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 150,
        width: size.width,
        child: Stack(
          children: [
            realEstateBackgroundImage(widthSize: size.width),
            advertisementInformationContainer(widthSize: size.width),
          ],
        ),
      ),
    );
  }

  Widget realEstateBackgroundImage({required double widthSize}) {
    return SizedBox(
      height: 150,
      width: widthSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: CachedNetworkImage(
          cacheManager: custonCachedManager,
          imageUrl:
              "https://i.pinimg.com/736x/26/81/70/2681707747d6f7e0965cfe186f1effbb.jpg",
          height: 180,
          width: widthSize,
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
      ),
    );
  }

  Widget advertisementInformationContainer({required double widthSize}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            height: 150,
            width: widthSize,
            color: Colors.black.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                advertisementTextAndDiscountText(widthSize: 190),
                advertisementDateText(widthSize: 153),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget advertisementTextAndDiscountText({required double widthSize}) {
    return SizedBox(
      width: widthSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //RERAL ESTATE NAME
            Text(
              "Let's buy a house here",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10.0),
            //REAL ESTATE RENT PRICE
            Text(
              'Diskon 10%',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget advertisementDateText({required double widthSize}) {
    return SizedBox(
      width: widthSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 65.0),
            //DATE
            Text(
              '12 October 2022',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
