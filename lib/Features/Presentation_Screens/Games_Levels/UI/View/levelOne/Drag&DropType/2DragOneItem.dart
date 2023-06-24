import 'dart:math';

import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/WinPage.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../Widget/DragTargetCustom.dart';
import '../../../Widget/DragableCustom.dart';
import '../../../Widget/GameDescriptionText.dart';
import '../../../Widget/LosePage.dart';
import '../../../Widget/showWinFailPages.dart';

class DragTwoItem extends StatelessWidget {
  DragTwoItem({required this.answerIndex,required this.fristImgIndex,required this.secondImgIndex});
  int answerIndex;
  int fristImgIndex;
  int secondImgIndex;
  // List<double> drag = [20, 40, 80, 100, 120, 140, 160, 180, 200, 220];
  // List<double> Xvector = [20, 40];
  // List<double> Yvector = [50, 60, 80, 90, 100, 120, 140, 160, 170, 180];
  // Random Xrandom = Random();
  // Random Yrandom = Random();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<ProviderLevelForm, ProviderReceptiveGame>(
          builder: (context, _, __, child) {
        return Stack(
          children: [
            Container(
              height: MyPageSize.height(context),
              width: MyPageSize.width(context),
              //color: Colors.red,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: MyPageSize.width(context),
                    //  color: Colors.deepPurple,
                    child: Center(
                      child:GameDescriptionText(AnswerText: ' ال${__.apiReceptiveResult.data!.images![answerIndex].name}',
                        LeftText: ' للظل المناسب لها',
                        RightText: 'اسحب ',
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 130,
                    child: DragTargetCustom(
                        dataAnswer: '${__.apiReceptiveResult.data!.images![answerIndex].name}',
                        image:
                            '${__.apiReceptiveResult.data!.images![answerIndex].img}'),
                  ),
                  Positioned(
                    bottom: 100,
                    right: 35,
                    child: DragableCustom(
                      data: '${__.apiReceptiveResult.data!.images![fristImgIndex].name}',
                      image:
                          '${__.apiReceptiveResult.data!.images![fristImgIndex].img}',
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left:35,
                    child: DragableCustom(
                      data:
                          '${__.apiReceptiveResult.data!.images![secondImgIndex].name}',
                      image:
                          '${__.apiReceptiveResult.data!.images![secondImgIndex].img}',
                    ),
                  ),
                  //Positioned(bottom: 10,left: 50,child: DragableCustom(data: 'adsd',image: 'Mango',))
                ],
              ),
            ),
            ShowWinFailPage(),
          ],
        );
      }),
    );
  }
}
