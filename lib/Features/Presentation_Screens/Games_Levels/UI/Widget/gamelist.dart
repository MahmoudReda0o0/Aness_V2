import 'package:flutter/material.dart';
import '../View/levelOne/Drag&DropType/1DragOneItem.dart';
import '../View/levelOne/Drag&DropType/2DragOneItem.dart';
import '../View/levelOne/Drag&DropType/3DragOneItem.dart';
import '../View/levelOne/Drag&DropType/4DragFourItem.dart';
import '../View/levelOne/SelectItem/1SelectOne.dart';
import '../View/levelOne/SelectItem/2SelectTwo.dart';
import '../View/levelOne/SelectItem/3SelectThree.dart';
import '../View/levelOne/SelectItem/4SelectFour.dart';
import '../View/levelThree/TalkToAnees.dart';
import '../View/levelTwo/RecordFruitName.dart';
import '../View/levelTwo/RecordFruitSound.dart';

class GameList {
  static List<String> FruitName = ['Apple', 'Banana', 'Mango', 'Watermelon'];
  static List<String> FruitNameArabic = ['تفاح', 'موز', 'مانجا', 'بطيخ'];

  static List<Widget> LevelFive = [
    //TalkToAnees(),
    RecordFruitSound(),
    SelectFour(
        answerIndex: 3,
        fristFruitIndex: 2,
        secondFruitIndex: 0,
        thirdFruitIndex: 3,
        fourFruitIndex: 1),
    SelectThree(
        answerIndex: 3,
        fristFruitIndex: 2,
        secondFruitIndex: 1,
        thirdFruitIndex: 3),
    SelectTwo( answerIndex: 3,fristFruitIndex: 0, secondFruitIndex: 3),
    DragThreeItem(
        answerIndex: 3, fristImgIndex: 3, secondImgIndex: 1, thirdImgIndex: 0),
    DragTwoItem(answerIndex: 3, fristImgIndex: 1, secondImgIndex: 3),
    DragOneItem(answerIndex: 3),
  ]; //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three
  static List<Widget> LevelFour = [
    //TalkToAnees(),
    RecordFruitSound(),
    SelectFour(
        answerIndex: 3,
        fristFruitIndex: 1,
        secondFruitIndex: 3,
        thirdFruitIndex: 2,
        fourFruitIndex: 0),
    SelectThree(
        answerIndex: 3,
        fristFruitIndex: 2,
        secondFruitIndex: 0,
        thirdFruitIndex: 3),
    SelectTwo( answerIndex: 3,fristFruitIndex: 3, secondFruitIndex: 2),
    DragThreeItem(
        answerIndex: 3, fristImgIndex: 3, secondImgIndex: 0, thirdImgIndex: 1),
    DragTwoItem(answerIndex: 3, fristImgIndex: 2, secondImgIndex: 3),
    DragOneItem(answerIndex: 3),


  ]; //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three

  static List<Widget> LevelThree = [
    //TalkToAnees(),
    RecordFruitSound(),
    SelectFour(
        answerIndex: 1,
        fristFruitIndex: 2,
        secondFruitIndex: 0,
        thirdFruitIndex: 3,
        fourFruitIndex: 1),
    SelectThree(
        answerIndex: 1,
        fristFruitIndex: 2,
        secondFruitIndex: 1,
        thirdFruitIndex: 0),
    SelectTwo( answerIndex: 1,fristFruitIndex: 3, secondFruitIndex: 1),
    DragThreeItem(
        answerIndex: 1, fristImgIndex: 2, secondImgIndex: 1, thirdImgIndex: 0),
    DragTwoItem(answerIndex: 1, fristImgIndex: 1, secondImgIndex: 3),
    DragOneItem(answerIndex: 1),

  ]; //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three

  static List<Widget> LevelTwo = [
    // TalkToAnees(),
    RecordFruitSound(),
    SelectFour(
        answerIndex: 1,
        fristFruitIndex: 3,
        secondFruitIndex: 0,
        thirdFruitIndex: 1,
        fourFruitIndex: 2),
    SelectThree(
        answerIndex: 1,
        fristFruitIndex: 0,
        secondFruitIndex: 1,
        thirdFruitIndex: 3),
    SelectTwo( answerIndex: 1,fristFruitIndex: 0, secondFruitIndex: 1),


    DragThreeItem(
        answerIndex: 1, fristImgIndex: 3, secondImgIndex: 0, thirdImgIndex: 1),
    DragTwoItem(answerIndex: 1, fristImgIndex: 2, secondImgIndex: 1),
    DragOneItem(answerIndex: 1),
  ]; //  9 Games => 8 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo + 1 Game Three

  static List<Widget> LevelOne = [
    // GameOneAnswer => index 3
    //TalkToAnees(),
    RecordFruitSound(),
    SelectFour(
        answerIndex: 1,
        fristFruitIndex: 0,
        secondFruitIndex: 3,
        thirdFruitIndex: 2,
        fourFruitIndex: 1),
    SelectThree(
        answerIndex: 1,
        fristFruitIndex: 1,
        secondFruitIndex: 0,
        thirdFruitIndex: 3),
    SelectTwo( answerIndex: 1,fristFruitIndex: 2, secondFruitIndex: 1),
    DragThreeItem(
        answerIndex: 1, fristImgIndex: 3, secondImgIndex: 0, thirdImgIndex: 1),
    DragTwoItem(answerIndex: 1, fristImgIndex: 1, secondImgIndex: 3),
    DragOneItem(answerIndex: 1),


  ]; //  8 Games => 7 GameOne[ 1 + 2 + 2 + 2 ] +  1 GameTwo

  static List<Widget> levelZero = [
    // GameOneAnswer => index 3
    //TalkToAnees(),
    RecordFruitSound(),
    SelectFour(
        answerIndex: 1,
        fristFruitIndex: 0,
        secondFruitIndex: 3,
        thirdFruitIndex: 2,
        fourFruitIndex: 1),
    DragTwoItem(answerIndex: 1, fristImgIndex: 1, secondImgIndex: 3),



  ];
}
