import 'package:flutter/material.dart';

//Models
import '../models/real_estate_model.dart';

//Widgets
import '../home_screen/real_estate_container.dart';

class AllRealEstateList extends StatelessWidget {
  final List<RealEstate> realEstates;

  AllRealEstateList({required this.realEstates});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: realEstates.length,
      itemBuilder: (context, index) {
        return RealEstateContainer(realEstate: realEstates[index]);
      },
    );
  }
}
