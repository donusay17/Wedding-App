
import 'package:flutter/material.dart';
import 'package:bootcamp165/screens/splash/components/openingPage.dart';
import 'package:bootcamp165/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "splash";
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: openingPage(),
    );
  }
}
