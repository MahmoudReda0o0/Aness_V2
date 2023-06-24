import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:autism_app/Features/Presentation_Screens/SplashScreen/UI/View/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../../../../Core/constant.dart';
import '../../../Games_Levels/UI/Widget/GameDescriptionText.dart';
import '../../../Games_Levels/UI/Widget/LosePage.dart';
import '../../../Games_Levels/UI/Widget/WinPage.dart';
import '../../../Games_Levels/UI/Widget/showWinFailPages.dart';

class OfflineGame extends StatefulWidget {
  const OfflineGame({Key? key}) : super(key: key);

  @override
  State<OfflineGame> createState() => _OfflineGameState();
}
List<String> fruitAnswer = ['عنب','موز','تفاح','بطيخ'];
List<String> fruitOne =['موز','بطيخ','عنب','تفاح'];
List<String> fruitTwo =['بطيخ','موز','تفاح','عنب'];
List<String> fruitThree =['عنب','تفاح','بطيخ','موز'];
List<String> fruitfour =['تفاح','عنب','موز','بطيخ'];

String img ='assets/image/offlinegame/';
Random rand =Random();
late int fruitRand ;


TextToSpeech tts = TextToSpeech();
 speak({required String text})  {

  tts.setVolume(1.00);
  tts.setRate(0.93);
  tts.setLanguage('ar');
  tts.setPitch(1.44);
  tts.speak(text);
}

class _OfflineGameState extends State<OfflineGame> {

  @override
  void initState(){
    super.initState();
    fruitRand = rand.nextInt(4);
  }
  bool winPage = false;
  bool losePage = false;
  int winCount =0;
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
                //color: Colors.red,
                child: Stack(
                  children: [
                    Positioned(
                      top:50,
                      child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: MyPageSize.width(context),
                      //  color: Colors.deepPurple,
                      child: Center(
                        child: GameDescriptionText(AnswerText: ' ال${fruitAnswer[fruitRand]}',
                          LeftText: ' للظل المناسب لها',
                          RightText: 'اسحب ',
                        ),
                      ),
                    ),),
                    Positioned(
                      top: 140,
                      left: 120,
                      child: DragTargetFruit(),
                    ),
                    Positioned(
                      bottom: 230,
                      left: 30,
                      child: DragableFruit(
                          data: fruitOne[fruitRand],

                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 30,
                      child: DragableFruit(
                          data: fruitTwo[fruitRand]
                      ),
                    ),
                    Positioned(
                      bottom: 230,
                      right: 30,
                      child: DragableFruit(
                          data: fruitThree[fruitRand]
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 30,
                      child: DragableFruit(
                        data: fruitfour[fruitRand]
                      ),
                    ),
                    //Positioned(bottom: 10,left: 50,child: DragableCustom(data: 'adsd',image: 'Mango',))
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
  Widget DragTargetFruit(){
    return DragTarget<String>(
      onAccept: (data) async {
        if (data == fruitAnswer[fruitRand]) {
          print('WIN');
          speak(text: 'أحسنتَ يا بطلْ');
          setState(() {
            winPage = true;
            fruitRand = rand.nextInt(4);
            winCount++;
          });
          await Future.delayed(Duration(seconds: 3));
          setState(() {
            winPage = false;
          });
          if(winCount >=3){
            print('Navigate to SplashScreen , winCount :$winCount');
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
          }
          else{
            print('winCount :$winCount');
          }
          //function();
        } else {
          speak(text: 'حاولْ مرة أُخرَى');
          print('LOSE');
          setState(() {
            losePage = true;
          });
          await Future.delayed(Duration(seconds: 3));
          setState(() {
            losePage = false;
          });
        }
        // setState(() {
        //   selectedFruit = data;
        // });
      },
      builder: (context, data, rejecteddata) {
        return Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColor().gray_wihte2.withOpacity(0.5)
          ),
          child: Opacity(
            opacity: 0.5,
            //child: Center(child: Text('${fruitAnswer[fruitRand]}'),),
            child: Image(
              image: AssetImage(
                  '$img${fruitAnswer[fruitRand]}.png'),
            ),
          ),
        );
      },
    );
  }
  Widget DragableFruit({required String data}) {
    double cord =140;
    return Draggable<String>(
      data: data,
      child: Container(
        height: cord,
        width: cord,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColor().pink.withOpacity(0.1),
        ),
        //color: Colors.grey.withOpacity(0.5),
        //child: Center(child: Text(data),),
        child: Image(
          image: AssetImage('$img$data.png'),
        ),
      ),
      feedback: Container(
        height: cord,
        width: cord,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: MyColor().pink.withOpacity(0.1),
        ),
        //child: Center(child: Text(data),),
        child: Image(
          image: AssetImage('$img$data.png'),
        ),
      ),
      childWhenDragging: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColor().pink.withOpacity(0.1),
        ),
        height: cord,
        width: cord,
      ),
    );
  }

}


// AnimatedSplashScreen(
// backgroundColor: Color(0xFFf79999),
// curve: Curves.bounceOut,
// duration:2000,
// splashIconSize: 250,
// splash: Container(
// height: 230,
// width: 150,
// child: Image(
// fit: BoxFit.fill,
// image: AssetImage('assets/image/anesspic/anees6.png'),
// ),
// ),
// nextScreen:  Scaffold(
// body: Center(
// key: UniqueKey(),
// child: TextButton(
// onPressed: () {},
// child: const Text(
// 'Open Offline Game Mode',
// style: TextStyle(
// color: Colors.red,
// fontSize: 30,
// ),
// ),
// ),
// ),
// ),
// );