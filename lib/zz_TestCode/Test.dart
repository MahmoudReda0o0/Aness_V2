import 'dart:io';

import 'package:autism_app/ApiData/Models/ReceptiveModel.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/View/levelThree/TalkToAnees.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderTextToSpeech.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ApiData/AnessData/Get/ChildProfileApi.dart';
import '../ApiData/AnessData/Get/ReceptiveGame.dart';
import '../ApiData/AnessData/Post/GameAnswer.dart';
import '../Features/Widgets/TextToSpeechV1.dart';
import '../Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Future<ApiReceptiveResult>? apiResult;

  GameAnswer answer = GameAnswer();
  @override
  void initState() {
    super.initState();
    // apiResult = ApiServesesReceptiveGame().getReceptiveData(level: 1);
  }

  @override
  Widget build(BuildContext context) {
    String name = 'خالد';
    Map<String, String> alpha = {
      "د": "دْ",
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('game Api Test'),
        centerTitle: true,
      ),
      body: Consumer<ProviderChildProfile>(
        builder: (context, _, child) {
          return Center(
            child: ElevatedButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context)=>TalkToAnees()));
              },
              child: FlutterLogo(size: 20),
            ),
          );
        },
      ),
    );
  }
}
