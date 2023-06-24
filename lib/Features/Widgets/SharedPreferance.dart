import 'package:autism_app/Features/Presentation_Screens/App_Start_Page/UI/View/StartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefranceCustom extends StatefulWidget {
  const SharedPrefranceCustom({Key? key}) : super(key: key);

  @override
  State<SharedPrefranceCustom> createState() => _SharedPrefranceCustomState();
}

class _SharedPrefranceCustomState extends State<SharedPrefranceCustom> {
  String SharedKey = "RememberMyLogin";
  bool? sharedValue;
  bool checkBox = false;

  Shared_SetData(bool data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(SharedKey, data);
  }

  Shared_GetData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    sharedValue = pref.getBool(SharedKey);
    setState(() {});
  }

  Shared_Navigate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (sharedValue == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StartPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    print('');
    Shared_GetData();
    Shared_Navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SharedPreferanceCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
