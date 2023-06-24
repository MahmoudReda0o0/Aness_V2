import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/AiFruitSound.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/GameAnswer.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderAccountRegister.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderData.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderStartPage.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Features/Presentation_Screens/SplashScreen/UI/View/SplashScreen.dart';
import 'Statemanagement/Provider/ApiProvider/AnessData/ExpressiveGame.dart';
import 'Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';


GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> get navigationKey => _navigationKey;

String GlobalAccessToken ='';


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
      ChangeNotifierProvider<ProviderReceptiveGame>(create: (context)=>ProviderReceptiveGame()),
      ChangeNotifierProvider<ProviderExpressiveGame>(create: (context)=>ProviderExpressiveGame()),
      ChangeNotifierProvider<ProviderGameAnswer>(create: (context)=>ProviderGameAnswer()),
      ChangeNotifierProvider<ProviderStartPage>(create: (context)=>ProviderStartPage()),
      ChangeNotifierProvider<ProviderAiSound>(create: (context)=>ProviderAiSound()),
      ChangeNotifierProvider<ProviderChildProfile>(create: (context)=>ProviderChildProfile()),
    ],
      child: ConnectionNotifier(
        child: MaterialApp(
          navigatorKey: navigationKey,
          debugShowCheckedModeBanner: false,
          title: 'Anees ',
          theme: ThemeData(
              fontFamily: ('Alexandria')
          ),
          home:SplashScreen(),
    ),
      ),);
  }
}


