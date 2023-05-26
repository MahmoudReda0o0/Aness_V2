import 'package:autism_app/Features/Presentation_Screens/App_Start_Page/UI/View/StartPage.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderAccountRegister.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderData.dart';
import 'package:autism_app/zz_TestCode/MainPage.dart';
import 'package:autism_app/zz_TestCode/Test.dart';
//import 'package:autism_app/UI/Screen/Sign_In_Screens/CreateNewAccount.dart';
//import 'package:autism_app/UI/Screen/Sign_In_Screens/ForgetPassword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Features/Presentation_Screens/AccountRegister/UI/View/RegisterEmailPass.dart';
import 'Features/Presentation_Screens/AccountRegister/UI/View/moreDetail.dart';
import 'Features/Presentation_Screens/Games_Levels/UI/View/LevelForm/LevelFormOne.dart';
import 'Features/Presentation_Screens/Games_Levels/UI/View/levelTwo/RecordFruitSound.dart';
import 'Features/Presentation_Screens/Sign_in/UI/View/signIn.dart';
import 'Features/Presentation_Screens/SplashScreen/UI/View/SplashScreen.dart';
import 'Statemanagement/Provider/ApiProvider/Auth/SigninProvider.dart';
import 'Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';


//import 'UI/Screen/games/levelTwo/FruitName.dart';

//import 'UI/Screen/Sign_In_Screens/Sign_In.dart';
//import 'UI/Screen/Sign_In_Screens/forget_password/1.RestoreWay.dart';
// import 'UI/Screen/profile/Personal Page.dart';
//import 'UI/Screen/profile/ProfileSetting.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ProviderLevelForm>(create: (context)=>ProviderLevelForm()),
      ChangeNotifierProvider<ProviderData>(create: (context)=>ProviderData()),
      ChangeNotifierProvider<ProviderAccountRegister>(create: (context)=>ProviderAccountRegister()),
      ChangeNotifierProvider<ProviderLoginToken>(create: (context)=>ProviderLoginToken()),
      //ChangeNotifierProvider<SigninProvider>(create: (context)=>SigninProvider()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

            fontFamily: ('Alexandria')
          //fontFamily: ('Alexandria')
        ),
        home:SplashScreen(),
    ),);
  }
}


