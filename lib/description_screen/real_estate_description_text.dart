import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealEstateDescriptionText extends StatefulWidget {
  final String description;

  RealEstateDescriptionText({required this.description});

  @override
  State<RealEstateDescriptionText> createState() =>
      _RealEstateDescriptionTextState();
}

class _RealEstateDescriptionTextState extends State<RealEstateDescriptionText> {
  bool reduceLines = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          maxLines: reduceLines ? 3 : null,
          style: GoogleFonts.roboto(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              reduceLines = !reduceLines;
            });
          },
          child: Text(
            reduceLines ? 'Read More' : 'Read Less',
            style: GoogleFonts.roboto(
              color: Colors.cyan.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
