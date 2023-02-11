import 'package:autism_app/UI/Screen/MainPage.dart';
//import 'package:autism_app/UI/Screen/Sign_In_Screens/CreateNewAccount.dart';
//import 'package:autism_app/UI/Screen/Sign_In_Screens/ForgetPassword.dart';
import 'package:autism_app/UI/Screen/SplashScreen.dart';
import 'package:flutter/material.dart';
//import 'UI/Screen/Sign_In_Screens/Sign_In.dart';
//import 'UI/Screen/Sign_In_Screens/forget_password/1.RestoreWay.dart';
import 'UI/Screen/profile/Personal Page.dart';
import 'UI/Screen/profile/ProfileSetting.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          fontFamily: ('Alexandria')
          //fontFamily: ('Alexandria')
        ),
        home:SplashScreen.SplashScreen_set()
    );
  }
}


