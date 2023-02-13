import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:autism_app/UI/Screen/SignLog/SignIn/signIn.dart';
import 'package:flutter/material.dart';

//import 'Sign_In_Screens/Sign_In.dart';

class SplashScreen {
  static SplashScreen_set({var page}) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xFFf79999),
      curve: Curves.bounceOut,
      duration:2000,
      splashIconSize: 250,
      splash: Container(
        height: 230,
        width: 150,
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage('assets/image/splash.png'),
        ),
      ),
      nextScreen: SignIn(),
    );
  }
}
