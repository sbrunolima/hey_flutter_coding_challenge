import 'package:flutter/material.dart';

class MySizedBox extends StatelessWidget {
  final double height;

  MySizedBox({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
