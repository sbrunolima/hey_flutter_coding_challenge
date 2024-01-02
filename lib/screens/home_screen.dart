import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/real_estate_provider.dart';

//Widgets
import '../login_screen/appbar_title_widget.dart';
import '../home_screen/dummy_searchbar_widget.dart';
import '../home_screen/all_real_estate_list.dart';
import '../home_screen/scored_real_estate_list.dart';
import '../home_screen/popular_selector_wiidget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 15.0);

    final loadedRealEstatesData =
        Provider.of<RealEstateProvider>(context, listen: false);

    //LOAD ALL REAL ESTATES
    final allRealEstates = loadedRealEstatesData.realEstate;
    //LOAD ONLY THE REALS ESTATES THAT HAS MORE THAN 4 STARS
    final scoredRealEstates = loadedRealEstatesData.realEstate
        .where((data) => data.stars >= 4.0)
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
              DummySearchBarWidget(),
              sizedBox,
              ScoredRealEstateList(realEstates: scoredRealEstates),
              sizedBox,
              PopularSelectorWidget(),
              sizedBox,
              AllRealEstateList(realEstates: allRealEstates),
              sizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
