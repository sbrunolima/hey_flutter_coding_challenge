import 'package:flutter/material.dart';

//Models
import '../models/real_estate_model.dart';

//Widgets
import '../home_screen/real_estate_container.dart';

class ScoredRealEstateList extends StatelessWidget {
  final List<RealEstate> realEstates;

  ScoredRealEstateList({required this.realEstates});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: 210,
        child: ListView.separated(
            shrinkWrap: true,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: realEstates.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: size.width - 30,
                child: RealEstateContainer(realEstate: realEstates[index]),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10)),
      ),
    );
  }
}
