import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Models
import '../models/real_estate_model.dart';

//Widgets
import '../widgets/my_sized_box.dart';
import '../description_screen/real_estate_image.dart';
import '../description_screen/payment_bottom_navbar.dart';
import '../description_screen/real_estate_stars.dart';
import '../description_screen/real_estate_name_and_favorite.dart';
import '../description_screen/real_estate_description_text.dart';
import '../description_screen/real_estate_map_location.dart';

class RealEstateDescriptionScreen extends StatefulWidget {
  final RealEstate realEstate;

  RealEstateDescriptionScreen({required this.realEstate});

  @override
  State<RealEstateDescriptionScreen> createState() =>
      _RealEstateDescriptionScreenState();
}

class _RealEstateDescriptionScreenState
    extends State<RealEstateDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //REAL STATE IMAGE COOONTAINER
            RealEstateImage(
              realStateImageUrl: widget.realEstate.realEstateImageUrl,
            ),
            MySizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySizedBox(height: 20.0),
                  //REAL ESTATE STARS
                  RealEstateStars(stars: widget.realEstate.stars),
                  MySizedBox(height: 20.0),
                  //REAL ESTATE FAVORITE BUTTON
                  RealEstateNameAndFavorite(
                    realEstateName: widget.realEstate.realEstateName,
                    isFavorite: widget.realEstate.isFavorite,
                  ),
                  MySizedBox(height: 10),
                  desctiptiontetxt(),
                  MySizedBox(height: 10),
                  //REAL ESTATE DESCRIPTION
                  RealEstateDescriptionText(
                    description: widget.realEstate.realEstateDescription,
                  ),
                  MySizedBox(height: 20.0),
                  //REAL ESTATE MAP LOCATIONS
                  RealEstateMapLocation(
                    locationUrl: widget.realEstate.realEstateMapLocation,
                  ),
                  MySizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PaymentBottomNavBar(
        rentPrice: widget.realEstate.realEstatePrice,
      ),
    );
  }

  Widget desctiptiontetxt() {
    return Text(
      'Description',
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
