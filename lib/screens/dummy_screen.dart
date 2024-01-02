import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widgets
import '../login_screen/appbar_title_widget.dart';

class DummyScreen extends StatelessWidget {
  final String pageTitle;

  DummyScreen({required this.pageTitle});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Text(
            pageTitle,
            style: GoogleFonts.roboto(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
