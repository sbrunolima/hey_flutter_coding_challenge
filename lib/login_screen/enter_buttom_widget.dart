import 'package:flutter/material.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:google_fonts/google_fonts.dart';

//Screens
import '../screens/start_screen.dart';

//Widgets
import '../widgets/custom_page_route_widget.dart';

class EnterButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.cyan.shade400),
          backgroundColor: Colors.cyan.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              CustomPageRouteWidget(child: StartScreen()),
              ModalRoute.withName('/login-screen'));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Icon(
              EneftyIcons.arrow_right_4_outline,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
