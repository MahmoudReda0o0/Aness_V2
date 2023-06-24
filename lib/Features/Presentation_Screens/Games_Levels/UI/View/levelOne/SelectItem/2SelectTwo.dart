import 'dart:math';
import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/GameDescriptionText.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/SelectFruitCubeCustom.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Widget/LosePage.dart';
import '../../../Widget/WinPage.dart';
import '../../../Widget/showWinFailPages.dart';

class SelectTwo extends StatelessWidget {
  SelectTwo(
      {required this.fristFruitIndex,
      required this.answerIndex,
      required this.secondFruitIndex});
  int answerIndex;
  int fristFruitIndex;
  int secondFruitIndex;
  // int ThirdFruitIndex;
  // int FourFruitIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<ProviderReceptiveGame, ProviderLevelForm>(
        builder: (context, _Rec, _levelForm, child) {
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
                bottom: 200,
                right: 40,
                child: SelectFruitCubeCustom(
                    imageURL:
                    '${_Rec.apiReceptiveResult.data!.images![fristFruitIndex].img}',
                    cubeText: _Rec.apiReceptiveResult.data!
                        .images![fristFruitIndex].name!,
                    answerText: _Rec.apiReceptiveResult.data!.images![answerIndex].name!),
              ),
              Positioned(
                bottom: 200,
                left: 40,
                child: SelectFruitCubeCustom(
                    imageURL:
                    '${_Rec.apiReceptiveResult.data!.images![secondFruitIndex].img}',
                    cubeText: _Rec.apiReceptiveResult.data!
                        .images![secondFruitIndex].name!,
                    answerText: _Rec.apiReceptiveResult.data!.images![answerIndex].name!),
              ),
              ShowWinFailPage(),
            ],
          );
        },
      ),
    );
  }
}

// class SelectTwo extends StatefulWidget {
//   SelectTwo({required this.fristImgIndex,required this.secondImgIndex});
//   int fristImgIndex;
//   int secondImgIndex;
//
//
// int? colorId;
// int? color_user;
// MaterialColor block_color = Colors.grey;
// bool block_bool = false;
// // color[rondom_color.nextInt(color.length)];
//
// class SelectTwo_s extends State<SelectTwo> {
//   @override
//   void initState() {
//     super.initState();
//     colorId = 1;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<ProviderReceptiveGame, ProviderLevelForm>(
//       builder: (context, _Rec, _levelForm, child) {
//         return Stack(
//           children: [
//             Column(
//               children: [
//                 SizedBox(height: 30),
//                 GameDescriptionText(
//                     AnswerText: ' ال${_Rec.apiReceptiveResult.data!.answer}',
//                     LeftText: ' من الفواكة الآتية',
//                     RightText: 'إختر '),
//                 SizedBox(
//                   height: 350,
//                 ),
//                 SelectFruitCubeCustom(imageURL: 'http://54.86.189.155${_Rec.apiReceptiveResult.data!.images![widget.fristImgIndex].img}', CubeText: '${_Rec.apiReceptiveResult.data!.images![widget.fristImgIndex].name}')
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget color_row(
//     MaterialColor color_one,
//     int OneId,
//     MaterialColor color_two,
//     int TwoId,
//   ) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         block(color_one, OneId, 'ImageOneUrl'),
//         block(color_two, TwoId, 'ImageTwoUrl'),
//       ],
//     );
//   }
//
//   Widget block(MaterialColor color, int select, String ImageUrl) {
//     return GestureDetector(
//       onTap: () => {
//         setState(() {
//           color_user = select;
//           block_bool = !block_bool;
//         }),
//         print('user=> ${color_user}'),
//         print('com => ${colorId}'),
//         if (color_user == colorId)
//           {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('VICTORY'),
//               ),
//             ),
//             setState(() {
//               colorId = colorId! + 1;
//             }
//                 // colorIdList[colorIdRondom.nextInt(4)],
//                 ),
//           }
//         else
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('YOU DIED'),
//             ),
//           ),
//       },
//       child: Container(
//         height: 120,
//         width: 120,
//         color: color,
//         child: Center(
//           child: Text('${select}'),
//         ),
//       ),
//     );
//   }
// }
