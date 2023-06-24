import 'dart:io';

import 'package:autism_app/ApiData/Models/ReceptiveModel.dart';
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
              onPressed: () async {
                // await ApiServesesReceptiveGame().getReceptiveData(level: 1);
                print('child error : ${_.childProfileResult.errorMessage}');
                print('Ui print : ${_.childProfileResult}');
                print(
                    'Exp :${_.childProfileResult.childProfileModel!.accuracy!.expressive}');
                print(
                    'Res :${_.childProfileResult.childProfileModel!.accuracy!.receptive}');
                print(
                    'Social :${_.childProfileResult.childProfileModel!.accuracy!.social}');
                print(
                    'CurrentLevel :${_.childProfileResult.childProfileModel!.currentLevel}');
                print(
                    'userName :${_.childProfileResult.childProfileModel!.userInfo!.username}');
                print(
                    'email :${_.childProfileResult.childProfileModel!.userInfo!.email}');
                print(
                    'fristN :${_.childProfileResult.childProfileModel!.userInfo!.firstName}');
                print(
                    'Current level :${_.childProfileResult.childProfileModel!.currentLevel}');
              },
              child: FlutterLogo(size: 20),
            ),
          );
        },
      ),
    );
  }
}
