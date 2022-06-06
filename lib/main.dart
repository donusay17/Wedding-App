import 'package:bootcamp165/bottomBarHomePage.dart';
import 'package:bootcamp165/login_page.dart';
import 'package:bootcamp165/screens/splash/components/openingPage.dart';
import 'package:bootcamp165/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.routeName,
      home: SplashScreen(),
    );
  }
}
