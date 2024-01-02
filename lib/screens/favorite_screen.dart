import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

//Providers
import '../providers/real_estate_provider.dart';

//Widgets
import '../login_screen/appbar_title_widget.dart';
import '../home_screen/all_real_estate_list.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 15.0);

    final loadedRealEstatesData =
        Provider.of<RealEstateProvider>(context, listen: false);

    //LOAD ONLY THE REALS ESTATES THAT HAS MORE THAN 4 STARS
    final favoriteRealEstates = loadedRealEstatesData.realEstate
        .where((data) => data.isFavorite == true)
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        titleSpacing: 4.0,
        title: AppBarTitleWidget(),
        actions: const [
          Icon(EneftyIcons.notification_outline, size: 30.0),
          SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              sizedBox,
              favoriteTitleText(),
              sizedBox,
              AllRealEstateList(realEstates: favoriteRealEstates),
              sizedBox,
            ],
          ),
        ),
      ),
    );
  }

  Widget favoriteTitleText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Favorites',
          style: GoogleFonts.roboto(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 4.0),
        const Icon(
          EneftyIcons.heart_bold,
          color: Colors.red,
        )
      ],
    );
  }
}
