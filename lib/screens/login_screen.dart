import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/real_estate_provider.dart';

//Widgets
import '../login_screen/appbar_title_widget.dart';
import '../login_screen/login_body_title_widget.dart';
import '../login_screen/enter_buttom_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isInit = true;

  @override
  void initState() {
    super.initState();

    if (isInit) {
      Provider.of<RealEstateProvider>(context, listen: false).loadRealEstates();
    }

    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        titleSpacing: 4.0,
        title: AppBarTitleWidget(),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/initialPageImage.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                LoginBodyTitleWidget(),
                const SizedBox(height: 15.0),
                EnterButtonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
