import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Screens
import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './screens/start_screen.dart';

//Providers
import './providers/real_estate_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => RealEstateProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'HeyFlutter Coding Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          StartScreen.routeName: (ctx) => StartScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
