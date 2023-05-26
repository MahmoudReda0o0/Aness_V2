

import 'package:autism_app/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../Widgets/FreeWidget.dart';
import '../../../Games_Levels/UI/View/LevelForm/LevelFormOne.dart';



class LevelMap extends StatefulWidget {
  State<StatefulWidget> createState() => LevelMap_s();
}

class LevelMap_s extends State<LevelMap> {
  double heartCounter = 5;
  bool levelComplete = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      Provider.of<ProviderLevelForm>(context, listen: false).levelindex++;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FreeWidget().startPageBackImage(
                height: MyPageSize.height(context),
                width: MyPageSize.width(context)),
            Column(
              children: [
                Container(
                  height: MyPageSize.height(context) * 0.15,
                  width: MyPageSize.width(context),
                  child: Center(
                    child: SizedBox(
                      height: MyPageSize.height(context) * 0.12,
                      width: MyPageSize.width(context) * 0.96,
                      //color: Colors.blue,
                      child: Row(
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/image/games/levelmap/heart.png')),
                          TextButton(
                            onPressed: () {
                              setState(() => heartCounter = 5);
                              setState(() {
                                Provider.of<ProviderLevelForm>(context,
                                        listen: false)
                                    .levelindex = 0;
                              });
                            },
                            child: Text(
                              heartCounter.toInt().toString(),
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ),
                          Text(
                            'المستوي 2',
                            style:
                                TextStyle(fontSize: 15, color: MyColor().gray),
                          ),
                          SizedBox(
                            width: MyPageSize.width(context) * 0.1,
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
                // Container(
                //   height: MyPageSize.height(context)*0.8,
                //   width: MyPageSize.width(context),
                //   child: Image(
                //     image: AssetImage('assets/image/levelmap1.png'),
                //     fit: BoxFit.fitWidth,
                //   ),
                // )
                // Center(
                //   child: Text(
                //       '${Provider.of<ProviderLevelFormOne>(context).levelindex}'),
                // )
              ],
            ),
            levelPosition(levelindex: 5,page: LevelForm(), top: 152, right: 140),
            levelPosition(levelindex: 4,page: LevelForm(), top: 260, left: 100),
            levelPosition(levelindex: 3,page: LevelForm(), top: 350, right: 90),
            levelPosition(levelindex: 2,page: LevelForm(), bottom: 270, left: 80),
            levelPosition(levelindex: 1,page: LevelForm(), bottom: 130, left: 180),

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
      required int levelindex,
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

              setState(() {
                levelComplete = true;
                // setState(() {
                //   Provider.of<ProviderLevelFormOne>(context,listen: false).levelindex++;
                // });
              });
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
          radius: 40,
          child: Image(
            image: levelindex < Provider.of<ProviderLevelForm>(context).levelindex
                ? AssetImage('assets/image/games/levelmap/finish.png')
                : levelindex == Provider.of<ProviderLevelForm>(context).levelindex
                    ? AssetImage('assets/image/games/levelmap/start.png')
                    : AssetImage('assets/image/games/levelmap/lock.png'),
          ),
        ),
      ),
    );
  }
}
