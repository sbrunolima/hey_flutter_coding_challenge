import 'dart:ui' as ui;
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

//Models
import '../models/real_estate_model.dart';

//Screens
import '../screens/real_estate_description_screen.dart';

//Widgets
import '../widgets/custom_page_route_widget.dart';

class RealEstateContainer extends StatelessWidget {
  final RealEstate realEstate;

  RealEstateContainer({required this.realEstate});

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

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CustomPageRouteWidget(
            child: RealEstateDescriptionScreen(realEstate: realEstate),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: 200,
          width: size.width,
          child: Stack(
            children: [
              realEstateBackgroundImage(widthSize: size.width),
              realEstateInformationContainer(widthSize: size.width),
            ],
          ),
        ),
      ),
    );
  }

  Widget realEstateBackgroundImage({required double widthSize}) {
    return SizedBox(
      height: 200,
      width: widthSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: CachedNetworkImage(
          cacheManager: custonCachedManager,
          imageUrl: realEstate.realEstateImageUrl[0],
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

  Widget realEstateInformationContainer({required double widthSize}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
        ),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            height: 80,
            width: widthSize,
            color: Colors.black.withOpacity(0.1),
            child: Row(
              children: [
                realEstateNameAndPrice(widthSize: widthSize - 170),
                realEstateStarsAndRoomsSize(widthSize: widthSize - 244),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget realEstateNameAndPrice({required double widthSize}) {
    return SizedBox(
      width: widthSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //RERAL ESTATE NAME
            Text(
              realEstate.realEstateName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10.0),
            //REAL ESTATE RENT PRICE
            Text(
              '\$ ${realEstate.realEstatePrice}/mo',
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

  Widget realEstateStarsAndRoomsSize({required double widthSize}) {
    return SizedBox(
      width: widthSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //REAL ESTATE STARS
            Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    EneftyIcons.star_bold,
                    size: 18,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    realEstate.stars.toString(),
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            //REAL ESTATE ROOMS
            Text(
              '${realEstate.realEstateRoomsSize} Room meet',
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
