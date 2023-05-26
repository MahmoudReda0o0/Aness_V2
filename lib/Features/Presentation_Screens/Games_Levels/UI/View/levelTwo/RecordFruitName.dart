import 'dart:math';


import 'package:autism_app/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:speech_to_text/speech_to_text.dart';

import '../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../../Widgets/TextCustom.dart';
import '../../Widget/WinPage.dart';
import '../../Widget/gamelist.dart';

class RecordFruitName extends StatefulWidget {
  const RecordFruitName({Key? key}) : super(key: key);

  @override
  State<RecordFruitName> createState() => _RecordFruitNameState();
}

Random random = Random();
int? FruitRand;

class _RecordFruitNameState extends State<RecordFruitName> {
  String text = '';
  String answer='';
  bool aneeshelp = false;
  bool winPage = false;
  bool buttonChild = false;

  @override
  void initState() {
    super.initState();
    FruitRand = random.nextInt(GameList.FruitName.length);
  }

  @override
  Widget build(BuildContext context) {
    SpeechToText speechToText = SpeechToText();

    return Stack(children: [
      SafeArea(
        child: Container(
          height: MyPageSize.height(context),
          width: MyPageSize.width(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextCustom(
                  title: "صف الصورة التي أمامك",
                  fontsize: 20,
                  color: MyColor().gray),
              SizedBoxCustom(),
              Container(
                height: 200,
                width: 200,
                //color: Colors.pink,
                child: Image(
                  image: AssetImage(
                      'assets/image/games/${GameList.FruitName[FruitRand!]}.png'),
                ),
              ),
              SizedBoxCustom(),
              SizedBox(
                  width: MyPageSize.width(context) * 0.9,
                  child: TextCustom(
                      title: answer, fontsize: 18, color: MyColor().gray)),
              SizedBox(
                child: Center(
                  child: Text(text),
                ),
              ),
              SizedBoxCustom(),
              Consumer<ProviderLevelForm>(
                builder: (context, ProviderLevel, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        buttonChild=true;
                      });
                      var available = await speechToText.initialize();
                      if (available) {
                        speechToText.listen(onResult: (result) {
                          setState(() {
                            text = result.recognizedWords;
                          });
                        });
                      }
                      await Future.delayed(Duration(seconds: 2));
                      setState(() {
                        answer =GameList.FruitNameArabic[FruitRand!];
                      });
                      await Future.delayed(Duration(seconds: 2));
                      setState(() {
                        winPage = true;
                        buttonChild=false;
                      });
                      await Future.delayed(Duration(seconds: 5));
                      setState(() {
                        ProviderLevel.LevelProgress = 0;
                        ProviderLevel.initTabPage = 0;
                        ProviderLevel.tabcontroller?.animateTo(0);
                        winPage = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: MyColor().pink,
                      ),
                    ),
                    child: Container(
                      height: 50,
                      width: MyPageSize.width(context)*0.8,
                      child: Center(
                        child: buttonChild
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/image/extra/voice.png'),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/image/extra/voice.png'),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/image/extra/voice.png'),
                                  ),
                                ],
                              )
                            : Wrap(
                                children: [
                                  TextCustom(
                                      title: 'اضغط للتحدث',
                                      fontsize: 17,
                                      color: MyColor().gray),
                                  Icon(
                                    Icons.mic,
                                    size: 25,
                                    color: MyColor().gray,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  );
                },
              ),
              // SizedBox(
              //   height: 30,
              // )
              // ElevatedButton(
              //   onPressed: (){
              //     speechToText.stop();
              //   },
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.white,
              //       side: BorderSide(
              //         color: MyColor().pink,
              //       )
              //   ),
              //   child: Container(
              //     height: 50,
              //     width: MyPageSize.width(context)*0.8,
              //     child: Center(
              //       child: Wrap(
              //         children: [
              //           TextCustom(title: 'Stop', fontsize: 17, color:MyColor().gray),
              //           Icon(Icons.mic,size: 25,color: MyColor().gray,),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBoxCustom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        aneeshelp = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        aneeshelp = false;
                      });
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: aneeshelp
                              ? MyColor().pink
                              : MyColor().gray.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)),
                      //color: Colors.pink,
                      child: Image(
                        image: AssetImage('assets/image/aneeshelp.png'),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      TextCustom(
                          title: 'صديقك أنيس هنا للمساعدة',
                          fontsize: 15,
                          color: MyColor().pink),
                      SizedBox(
                        height: 20,
                      ),
                      TextCustom(
                          title: 'اضغط لسماع اسم الصورة ',
                          fontsize: 13,
                          color: MyColor().gray)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // Consumer<ProviderLevelFormOne>(
      //   builder: (context, ProviderLevel, child) {
      //     return Positioned(
      //       bottom: 60,
      //       left: 120,
      //       child: CircleAvatar(
      //         backgroundColor: MyColor().gray.withOpacity(0.6),
      //         child: IconButton(
      //             onPressed: () async {
      //               setState(() {
      //                 winPage = true;
      //               });
      //               await Future.delayed(Duration(seconds: 2));
      //               setState(() {
      //                 ProviderLevel.starTwo = true;
      //                 ProviderLevel.LevelProgress = 0;
      //                 ProviderLevel.initTabPage = 0;
      //                 ProviderLevel.tabcontroller?.animateTo(0);
      //                 winPage = false;
      //               });
      //             },
      //             icon: Icon(
      //               Icons.mic_none,
      //             ),
      //             color: Colors.white),
      //       ),
      //     );
      //   },
      // ),
      Center(
        child: winPage ? WinPage() : SizedBox(),
      ),
    ]);
  }

  Widget SizedBoxCustom() {
    return SizedBox(
      height: 40,
    );
  }
}
