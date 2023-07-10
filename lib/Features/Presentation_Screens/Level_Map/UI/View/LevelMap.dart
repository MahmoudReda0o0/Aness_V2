import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/gamelist.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ExpressiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/SocialGame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import '../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../../main.dart';
import '../../../../Widgets/FreeWidget.dart';
import '../../../Games_Levels/UI/View/LevelForm/LevelFormOne.dart';
import '../../../Login/UI/View/Login.dart';

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
     // Provider.of<ProviderLevelForm>(context, listen: false).levelindex++;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer4<ProviderReceptiveGame, ProviderExpressiveGame,ProviderSocialGame,ProviderChildProfile>(
            builder: (context, _, __,___,_child, child) {
          return Stack(
            children: [
              FreeWidget().startPageBackImage(
                  height: MyPageSize.height(context),
                  width: MyPageSize.width(context)),
              Column(
                children: [
                  Container(
                    height: MyPageSize.height(context) * 0.15,
                    width: MyPageSize.width(context),
                    //color: Colors.pink,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontFamily: 'Alexandria', fontSize: 17),
                                children: [
                                  TextSpan(
                                    text: ' مرحبا بك يا ',
                                    style: TextStyle(
                                      color: MyColor().gray,
                                      //fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                      text: ' ${_child.childProfileResult?.childProfileModel!.userInfo!.firstName} ',
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
                                image: AssetImage(
                                    'assets/image/levelfaceicon.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 20,),
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: Image(
                                fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/image/games/levelmap/heart.png',
                                  ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() => heartCounter = 5);
                                setState(() {
                                  Provider.of<ProviderLevelForm>(context,
                                      listen: false)
                                      .levelindex = 1;
                                });
                              },
                              child: Text(
                                heartCounter.toInt().toString(),
                                style:
                                TextStyle(color: Colors.red, fontSize: 20),
                              ),
                            ),
                            SizedBox(width: 100,),
                            Text(
                              'انت في المستوي ${_child.childProfileResult!.childProfileModel!.currentLevel} ',
                              style: TextStyle(
                                  fontSize: 15, color: MyColor().gray),
                            ),
                            SizedBox(
                              width: MyPageSize.width(context) * 0.1,
                            ),
                          ],
                        ),
                      ],
                    )
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
              levelPosition(
                levelindex: 5,
                fun: () async {
                  await _.GetReceptiveData(level: 5);
                  await __.GetExpressiveData(level: 5);
                  await ___.GetSocialGame(level: 5);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelForm(
                          GamesList: GameList.LevelFive,
                          levelindex: 5,
                          initTapconPage: 7,
                          tabConLength: 8),
                    ),
                  );
                },
                top: 152,
                right: 140,
              ),
              levelPosition(
                levelindex: 4,
                fun: () async {
                  await _.GetReceptiveData(level: 4);
                  await __.GetExpressiveData(level: 4);
                  await ___.GetSocialGame(level: 4);
                       Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LevelForm(
                                levelindex: 4,
                                  GamesList: GameList.LevelFour,
                                  initTapconPage: 7,
                                  tabConLength: 8),
                            ),
                          );
                },
                top: 260,
                left: 100,
              ),
              levelPosition(
                levelindex: 3,
                fun: () async {
                  await _.GetReceptiveData(level: 3);
                  await __.GetExpressiveData(level: 3);
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LevelForm(
                                levelindex: 3,
                                  GamesList: GameList.LevelThree,
                                  initTapconPage: 6,
                                  tabConLength: 7),
                            ),
                          );
                },
                top: 350,
                right: 90,
              ),
              levelPosition(
                levelindex: 2,
                fun: () async {
                  await _.GetReceptiveData(level: 2);
                  await __.GetExpressiveData(level: 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelForm(
                        levelindex: 2,
                          GamesList: GameList.LevelTwo,
                          initTapconPage: 6,
                          tabConLength: 7),
                    ),
                  );
                },
                bottom: 270,
                left: 80,
              ),
              levelPosition(
                levelindex: 1,
                fun: () async {
                  await _.GetReceptiveData(level: 1);
                  await __.GetExpressiveData(level: 1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelForm(
                          GamesList: GameList.LevelOne,
                          levelindex: 1,
                          initTapconPage: 6,
                          tabConLength: 7),
                    ),
                  );
                },
                bottom: 130,
                left: 180,
              ),
              levelPosition(
                levelindex: 0,
                fun: () async {
                  await _.GetReceptiveData(level: 1);
                  await __.GetExpressiveData(level: 1);
                  await ___.GetSocialGame(level: 5);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelForm(
                          GamesList: GameList.levelZero,
                          levelindex: 1,
                          initTapconPage: 3,
                          tabConLength: 4),
                    ),
                  );
                },
                bottom: 120,
                left: 50,
              ),
              // Positioned(
              //   top: 20,
              //   left: 20,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       setState(() =>
              //       Provider.of<ProviderLoginToken>(context, listen: false)
              //           .state = LoginTokenState.pop);
              //       print(
              //           'state : ${Provider.of<ProviderLoginToken>(context, listen: false).state}');
              //       // Provider.of<ProviderLoginToken>(context,listen: false).initalLoginPage();
              //       Navigator.pushReplacement(context,
              //           MaterialPageRoute(builder: (context) => Login()));
              //     },
              //     child: FlutterLogo(size: 20),
              //   ),
              // ),

              // levelPosition(levelindex: 4,page: LevelForm(), top: 260, left: 100),
              // levelPosition(levelindex: 3,page: LevelForm(), top: 350, right: 90),
              // levelPosition(levelindex: 2,page: LevelForm(), bottom: 270, left: 80),
              // levelPosition(levelindex: 1,page: LevelForm(), bottom: 130, left: 180),

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
          );
        }),
      ),
    );
  }

  Widget levelPosition({
    //required var page,
    required int levelindex,
    required Function fun,
    double? top,
    double? bottom,
    double? right,
    double? left,
  }) {
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

              if(levelindex<= navigationKey.currentContext!.read<ProviderChildProfile>().childProfileResult!.childProfileModel!.currentLevel!){
                heartCounter--;
                fun();
              }else{
                FreeWidget().snackbar(context: context, content: 'عذرا لم تصل لهذا المستوي بعد', duration: 2);
              };
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => page),
              // );
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
            image:
                levelindex < Provider.of<ProviderChildProfile>(context).childProfileResult!.childProfileModel!.currentLevel!
                    ? AssetImage('assets/image/games/levelmap/finish.png')
                    : levelindex ==
                    Provider.of<ProviderChildProfile>(context).childProfileResult!.childProfileModel!.currentLevel!
                        ? AssetImage('assets/image/games/levelmap/start.png')
                        : AssetImage('assets/image/games/levelmap/lock.png'),
          ),
        ),
      ),
    );
  }
}
