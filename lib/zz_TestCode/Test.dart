import 'dart:io';

import 'package:autism_app/ApiData/Models/ReceptiveModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ApiData/AnessData/Get/ReceptiveGame.dart';
import '../ApiData/AnessData/Post/GameAnswer.dart';
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
  void initState(){
    super.initState();
    apiResult = ApiServesesReceptiveGame().getReceptiveData(level: 1);
  }
  @override
  Widget build(BuildContext context) {
    String name ='خالد';
    Map<String,String> alpha={
      "د": "دْ",
    };
    return Scaffold(
        appBar: AppBar(title: Text('game Api Test'),centerTitle: true,),
      body: Consumer<ProviderReceptiveGame>(
        builder: (context,_,child)  {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: ElevatedButton(
                onPressed: () async {
                 print(name+"ْ");
                    String newName =name.substring(0, name.length - 1);
                    newName+= alpha[name[name.length-1]]!;
                    print(newName);
                 for (int i = 1576; i < 1604; i++) {
                   alpha[String.fromCharCode(i )] = String.fromCharCode(i ) + "ْ";
                 }


                  print(alpha);
                },
                child: FlutterLogo(),
              ),)
            ],
          );
        }
      ),
    );
  }
}
