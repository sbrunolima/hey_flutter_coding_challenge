import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        appLogo(),
        appBrandName(),
      ],
    );
  }

  Widget appLogo() {
    return Image.asset(
      'assets/logo01.png',
      height: 60,
      width: 60,
    );
  }

  Widget appBrandName() {
    return Row(
      children: [
        Text(
          'Hey',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.cyan.shade400,
          ),
        ),
        const SizedBox(width: 5.0),
        Text(
          'Real Estate',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
