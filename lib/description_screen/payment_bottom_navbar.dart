import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentBottomNavBar extends StatelessWidget {
  final String rentPrice;

  PaymentBottomNavBar({required this.rentPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            realEstatePrice(),
            payNowButton(),
          ],
        ),
      ),
    );
  }

  Widget realEstatePrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Price',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        Text(
          '\$ $rentPrice',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ],
    );
  }

  Widget payNowButton() {
    return SizedBox(
      height: 50,
      width: 150,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.cyan.shade400),
          backgroundColor: Colors.cyan.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          'Pay now',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
