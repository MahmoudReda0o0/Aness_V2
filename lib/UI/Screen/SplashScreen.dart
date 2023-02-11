import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:autism_app/UI/Screen/SignLog/SignIn/signIn.dart';
import 'package:flutter/material.dart';

//import 'Sign_In_Screens/Sign_In.dart';

class SplashScreen {
  static SplashScreen_set({var page}) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xFFf79999),
      curve: Curves.linear,
      duration:5000,
      splash: Container(
        height: 270,
        width: 270,
        child: Container(
          height: 300,
          width: 300,
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/image/splash.png'),
          ),
        ),
      ),
      nextScreen: SignIn(),
    );
  }
}
