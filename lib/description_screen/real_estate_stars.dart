import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class RealEstateStars extends StatelessWidget {
  final double stars;

  RealEstateStars({required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < stars.round(); i++)
          const Icon(
            EneftyIcons.star_bold,
            color: Colors.orange,
            size: 30,
          ),
        for (int i = 0; i < (5 - stars.round()); i++)
          Icon(
            EneftyIcons.star_bold,
            color: Colors.orange.shade200,
            size: 30,
          )
      ],
    );
  }
}
