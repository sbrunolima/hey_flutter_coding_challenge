import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class MyBackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            EneftyIcons.arrow_left_4_outline,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
