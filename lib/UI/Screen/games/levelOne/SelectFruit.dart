import 'dart:math';

import 'package:autism_app/UI/Screen/games/Widget/LosePage.dart';
import 'package:autism_app/UI/Screen/games/levelOne/Widget/gamelist.dart';
import 'package:autism_app/UI/Widgets/TextCustom.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

import '../Widget/WinPage.dart';

class SelectFruit extends StatefulWidget {
  const SelectFruit({Key? key}) : super(key: key);

  @override
  State<SelectFruit> createState() => _SelectFruitState();
}

String selectedFruit = '';
Random FruitRandom = Random();
int? Fruitindex;

class _SelectFruitState extends State<SelectFruit> {
  bool winPage = false;
  bool losePage = false;
  int a=0;
  bool aaa = false;
  @override
  void initState() {
    super.initState();
    Fruitindex = FruitRandom.nextInt(GameList.FruitName.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MyPageSize.height(context),
            width: MyPageSize.width(context),
            child: Image(
              image: AssetImage('assets/image/games/vegetables.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: Container(
              height: MyPageSize.height(context),
              width: MyPageSize.width(context),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextCustom(
                      title: 'اختر الفاكهة الصحيحة',
                      fontsize: 18,
                      color: MyColor().gray),
                  SizedBox(
                    height: 20,
                  ),
                  TextCustom(
                      title: GameList.FruitNameArabic[Fruitindex!],
                      fontsize: 30,
                      color: MyColor().pink),
                  SizedBox(
                    height: 50,
                  ),
                  DragTarget<String>(
                    onAccept: (data) async {
                      if (data == GameList.FruitName[Fruitindex!]) {
                        print('win page');
                        setState(() {
                          winPage = true;
                        });
                        print(winPage);
                        await Future.delayed(Duration(seconds: 2));
                        setState(() {
                          winPage = false;
                        });
                        print(winPage);
                      } else  {
                        print('lose Page');
                        setState(() {
                          losePage = true;
                        });
                        print(losePage);
                        await Future.delayed(Duration(seconds: 2));
                        setState(() {
                          losePage = false;
                        });
                        print(losePage);
                      }
                      setState(() {
                        selectedFruit = data;
                      });
                    },
                    builder: (context, data, rejecteddata) {
                      return Container(
                        height: 180,
                        width: 180,
                        child: Opacity(
                          opacity: 0.6,
                          child: Image(
                            image: AssetImage(
                                'assets/image/games/${GameList.FruitName[Fruitindex!]}.png'),
                          ),
                        ),
                      );
                    },
                  ),
                  // Center(
                  //   child: Draggable<String>(
                  //     data: "apple",
                  //     child: Container(
                  //       height: 120,
                  //       width: 120,
                  //       child: Image(
                  //         image: AssetImage('assets/image/games/apple.png'),
                  //       ),
                  //     ),
                  //     feedback: Container(
                  //       height: 120,
                  //       width: 120,
                  //       child: Image(
                  //         image: AssetImage('assets/image/games/apple.png'),
                  //       ),
                  //     ),
                  //     childWhenDragging: Container(height: 120, width: 120),
                  //   ),
                  // ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DragFruit(data: 'Apple', FruitImage: 'Apple'),
                      DragFruit(data: 'Banana', FruitImage: "Banana"),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DragFruit(data: 'Mango', FruitImage: 'Mango'),
                      DragFruit(data: 'Watermelon', FruitImage: 'Watermelon'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: winPage ? WinPage() : SizedBox(),
          ),
          Center(
            child: losePage ? LosePage() : SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget DragFruit({required String data, required String FruitImage}) {
    return Draggable<String>(
      data: data,
      child: Container(
        height: 130,
        width: 130,
        child: Image(
          image: AssetImage('assets/image/games/${FruitImage}.png'),
        ),
      ),
      feedback: Container(
        height: 130,
        width: 130,
        child: Image(
          image: AssetImage('assets/image/games/${FruitImage}.png'),
        ),
      ),
      childWhenDragging: Container(height: 130, width: 130),
    );
  }
}
