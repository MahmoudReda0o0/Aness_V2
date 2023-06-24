import 'dart:math';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../Core/constant.dart';
import '../../../../../../../Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import '../../../Widget/GameDescriptionText.dart';
import '../../../Widget/SelectFruitCubeCustom.dart';
import '../../../Widget/showWinFailPages.dart';

class SelectThree extends StatelessWidget {
  SelectThree(
      {required this.fristFruitIndex,
        required this.answerIndex,
        required this.secondFruitIndex,
        required this.thirdFruitIndex,
      });
  int answerIndex;
  int fristFruitIndex;
  int secondFruitIndex;
  int thirdFruitIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProviderReceptiveGame,ProviderLevelForm>(
        builder: (context,_Rec,_levelForm,child){
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: GameDescriptionText(
                        AnswerText:
                        ' ال${_Rec.apiReceptiveResult.data!.images![answerIndex].name}',
                        LeftText: ' من الفواكة الآتية',
                        RightText: 'إختر '),
                  ),
                  SizedBox(
                    height: 350,
                  ),
                ],
              ),
              Positioned(
                bottom: 240,
                left: 120,
                child: SelectFruitCubeCustom(
                    imageURL:
                    '${_Rec.apiReceptiveResult.data!.images![fristFruitIndex].img}',
                    cubeText: _Rec.apiReceptiveResult.data!
                        .images![fristFruitIndex].name!,
                    answerText: _Rec.apiReceptiveResult.data!.images![answerIndex].name!),
              ),
              Positioned(
                bottom: 50,
                right: 30,
                child: SelectFruitCubeCustom(
                    imageURL:
                    '${_Rec.apiReceptiveResult.data!.images![secondFruitIndex].img}',
                    cubeText: _Rec.apiReceptiveResult.data!
                        .images![secondFruitIndex].name!,
                    answerText: _Rec.apiReceptiveResult.data!.images![answerIndex].name!),
              ),
              Positioned(
                bottom: 50,
                left: 30,
                child: SelectFruitCubeCustom(
                    imageURL:
                    '${_Rec.apiReceptiveResult.data!.images![thirdFruitIndex].img}',
                    cubeText: _Rec.apiReceptiveResult.data!
                        .images![thirdFruitIndex].name!,
                    answerText: _Rec.apiReceptiveResult.data!.images![answerIndex].name!),
              ),
              ShowWinFailPage(),
            ],
          );
        }
    );
  }
}


