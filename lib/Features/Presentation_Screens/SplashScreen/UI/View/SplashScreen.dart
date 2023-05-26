import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:autism_app/Features/Presentation_Screens/Login/UI/View/Login.dart';
import 'package:flutter/material.dart';

import '../../../Sign_in/UI/View/signIn.dart';

//import 'Sign_In_Screens/Sign_In.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      nextScreen: Login(),
    );
  }
}

// class SplashScreen {
//   static SplashScreen_set({var page}) {
//     return AnimatedSplashScreen(
//       backgroundColor: Color(0xFFf79999),
//       curve: Curves.bounceOut,
//       duration:2000,
//       splashIconSize: 250,
//       splash: Container(
//         height: 230,
//         width: 150,
//         child: Image(
//           fit: BoxFit.fill,
//           image: AssetImage('assets/image/splash.png'),
//         ),
//       ),
//       nextScreen: SignIn(),
//     );
//   }
// }
