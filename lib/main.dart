import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kadilabstore/UI/MappingPage.dart';
import 'package:kadilabstore/globalsvariable.dart';

import 'UI/HomePage.dart';
import 'UI/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        fontFamily: 'Segoe UI',
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: 'assets/image/logo.png',
          nextScreen: HomePage(),
          splashTransition: SplashTransition.decoratedBoxTransition,
          centered: true,
          duration: 3000,
        ),
    );
  }
}