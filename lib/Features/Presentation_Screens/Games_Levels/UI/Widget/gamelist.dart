import 'package:flutter/material.dart';
import '../View/levelOne/Drag&DropType/1DragOneItem.dart';
import '../View/levelOne/Drag&DropType/2DragOneItem.dart';
import '../View/levelOne/Drag&DropType/3DragOneItem.dart';
import '../View/levelOne/Drag&DropType/4DragFourItem.dart';
import '../View/levelThree/TalkToAnees.dart';
import '../View/levelTwo/RecordFruitName.dart';

class GameList{
  static List<String>FruitName=['Apple','Banana','Mango','Watermelon'];
  static List<String>FruitNameArabic=['تفاح','موز','مانجا','بطيخ'];

  static List<Widget> LevelFive = [
    TalkToAnees(),
    RecordFruitName(),
    DragFourItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex:2,thirdImagIndex:1,fourImgIndex: 2 ),
    DragFourItem(answerIndex: 3,fristImgIndex: 0,secondImgIndex: 3,thirdImagIndex: 2,fourImgIndex: 1),
    DragThreeItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex: 2,thirdImgIndex: 1),
    DragThreeItem(answerIndex: 3,fristImgIndex:0,secondImgIndex: 3, thirdImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 2,secondImgIndex: 3,),
    DragOneItem(answerIndex: 3),
  ];  //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three
  static List<Widget> LevelFour = [
    TalkToAnees(),
    RecordFruitName(),
    DragFourItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex:2,thirdImagIndex:1,fourImgIndex: 2 ),
    DragFourItem(answerIndex: 3,fristImgIndex: 0,secondImgIndex: 3,thirdImagIndex: 2,fourImgIndex: 1),
    DragThreeItem(answerIndex: 3,fristImgIndex: 1,secondImgIndex: 2,thirdImgIndex: 3),
    DragThreeItem(answerIndex: 3,fristImgIndex:0,secondImgIndex: 3, thirdImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 2,secondImgIndex: 3,),
    DragOneItem(answerIndex: 3),
  ];  //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three

  static List<Widget> LevelThree = [
    TalkToAnees(),
    RecordFruitName(),
    DragFourItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex:2,thirdImagIndex:1,fourImgIndex: 2 ),
    DragFourItem(answerIndex: 3,fristImgIndex: 0,secondImgIndex: 3,thirdImagIndex: 2,fourImgIndex: 1),
    DragThreeItem(answerIndex: 3,fristImgIndex: 1,secondImgIndex: 2,thirdImgIndex: 3),
    DragThreeItem(answerIndex: 3,fristImgIndex:0,secondImgIndex: 3, thirdImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 2,secondImgIndex: 3,),
    DragOneItem(answerIndex: 3),
  ]; //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three

  static List<Widget> LevelTwo = [
    TalkToAnees(),
    RecordFruitName(),
    DragFourItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex:2,thirdImagIndex:1,fourImgIndex: 2 ),
    DragFourItem(answerIndex: 3,fristImgIndex: 0,secondImgIndex: 3,thirdImagIndex: 2,fourImgIndex: 1),
    DragThreeItem(answerIndex: 3,fristImgIndex: 1,secondImgIndex: 2,thirdImgIndex: 3),
    DragThreeItem(answerIndex: 3,fristImgIndex:0,secondImgIndex: 3, thirdImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 2,secondImgIndex: 3,),
    DragOneItem(answerIndex: 3),
  ];  //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three

  static List<Widget> LevelOne = [ // GameOneAnswer => index 3
    RecordFruitName(),
    DragFourItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex:0,thirdImagIndex:1,fourImgIndex: 2 ),
    DragFourItem(answerIndex: 3,fristImgIndex: 0,secondImgIndex: 3,thirdImagIndex: 2,fourImgIndex: 1),
    DragThreeItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex: 2,thirdImgIndex: 1),
    DragThreeItem(answerIndex: 3,fristImgIndex:2,secondImgIndex: 3, thirdImgIndex: 0),
    DragTwoItem(answerIndex: 3,fristImgIndex: 3,secondImgIndex: 1),
    DragTwoItem(answerIndex: 3,fristImgIndex: 2,secondImgIndex: 3,),
    DragOneItem(answerIndex: 3),
  ];  //  8 Games => 7 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo



}