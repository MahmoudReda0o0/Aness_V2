import 'package:autism_app/UI/Widgets/FreeWidget.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

import '../../games/levelOne/ColorGame.dart';
import '../../games/levelOne/moving_Box.dart';

class LevelMap extends StatefulWidget {
  State<StatefulWidget> createState() => LevelMap_s();
}

class LevelMap_s extends State<LevelMap> {
  double heartCounter = 5;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FreeWidget().startPageBackImage(height: MyPageSize.height(context),width: MyPageSize.width(context)),
            Column(
              children: [
                Container(
                  height: MyPageSize.height(context)*0.15,
                  width: MyPageSize.width(context),
                  child: Center(
                    child: SizedBox(
                      height: MyPageSize.height(context) * 0.12,
                      width: MyPageSize.width(context) * 0.96,
                      //color: Colors.blue,
                      child: Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              setState(() => heartCounter = 5);
                            },
                            icon: Icon(
                              Icons.heart_broken,
                              color: Colors.red,
                            ),
                            label: Text(
                              heartCounter.toInt().toString(),
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            width: MyPageSize.width(context) * 0.02,
                          ),
                          Text(
                            'المستوي 2',
                            style:
                            TextStyle(fontSize: 15, color: MyColor().gray),
                          ),
                          SizedBox(
                            width: MyPageSize.width(context) * 0.15,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontFamily: 'Alexandria', fontSize: 17),
                              children: [
                                TextSpan(
                                  text: 'مرحبا بك',
                                  style: TextStyle(
                                    color: MyColor().gray,
                                    //fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                    text: ' أحمد ',
                                    style: TextStyle(
                                      color: MyColor().pink,
                                      //fontSize: 15
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image(
                              image:
                              AssetImage('assets/image/levelfaceicon.png'),
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MyPageSize.height(context)*0.8,
                  width: MyPageSize.width(context),
                  child: Image(
                    image: AssetImage('assets/image/levelmap1.png'),
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            ),
            levelPosition(page: MoveBox(), bottom: 152, right: 153),
            levelPosition(page: ColorGame(), bottom: 260, left: 127),

            // Positioned(
            //   bottom: 150,
            //   right: 150,
            //   child: CircleAvatar(
            //     backgroundColor: MyColor().gray_wihte2,
            //     radius: 40,
            //     child: Image(
            //       image: AssetImage('assets/image/lock.png'),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 250,
            //   left: 120,
            //   child: CircleAvatar(
            //     backgroundColor: MyColor().gray_wihte2,
            //     radius: 40,
            //     child: Image(
            //       image: AssetImage('assets/image/lock.png'),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget levelPosition(
      {required var page,
      double? top,
      double? bottom,
      double? right,
      double? left}) {
    return Positioned(
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      child: GestureDetector(
        onTap: () {
          setState(() {
            print('open level one');
            if (heartCounter > 0) {
              heartCounter--;
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => page),
              );
            } else
              FreeWidget().snackbar(
                  context: context,
                  content: 'كفاية لعب قوم ذاكر ينرم 🤓',
                  duration: 2,
                  fontSize: 20);
          });
        },
        child: CircleAvatar(
          backgroundColor: MyColor().gray_wihte2,
          radius: 36,
          child: Image(
            image: AssetImage('assets/image/lock.png'),
          ),
        ),
      ),
    );
  }
}
