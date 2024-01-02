import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealEstateNameAndFavorite extends StatelessWidget {
  final String realEstateName;
  final bool isFavorite;

  RealEstateNameAndFavorite(
      {required this.realEstateName, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width - 80,
          child: Text(
            realEstateName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        Icon(
          isFavorite ? EneftyIcons.heart_bold : EneftyIcons.heart_outline,
          size: 40,
          color: isFavorite ? Colors.red : Colors.black,
        )
      ],
    );
  }
}
