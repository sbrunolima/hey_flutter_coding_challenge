import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBodyTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyTitleWithTwoColors(),
        bodyTitleOnlyBlack(),
        const SizedBox(height: 10.0),
        bodySubtitle(),
      ],
    );
  }

  Widget bodyTitleWithTwoColors() {
    return Row(
      children: [
        Text(
          'Looking',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.cyan.shade400,
          ),
        ),
        const SizedBox(width: 6.0),
        Text(
          'for an',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget bodyTitleOnlyBlack() {
    return Text(
      'elegant house this is the place',
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: Colors.black,
      ),
    );
  }

  Widget bodySubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome friends, are you looking for us?',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Congrartulations, you have found us!',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
