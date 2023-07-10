import 'dart:math';

import 'package:autism_app/Features/Presentation_Screens/App_Start_Page/UI/View/StartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../../../main.dart';
import '../ApiProvider/AnessData/GameAnswer.dart';

class ProviderLevelForm extends ChangeNotifier{
  //int LevelProgress =2;
  TabController? levelFormTabController ;
  int levelForminitPage=2;

  int? levelMapGameIndex;

  TabController? startPageTapController;
  int startPageInitController=0;

  int levelindex=1;
  double sliderProgressValue = 100;
  bool starbool =false;
  bool winpage =false;
  bool losepage=false;
  bool talkbutton = false;
  bool levelComplete=false;

  String name ='يا بطلْ';
  void ChildName({required String childName}){
    name='يا '+'محمودْ';
    notifyListeners();
    print('Provider LevelForm Name : $name');
  }
  List<String> WinWords=['أَحْسَنْتَ  ','أَنَا فَخُور بِكَ  ','مُمْتَازٌ  ','كَم أَنْتَ ذَكِّيٌ  ','بارَكَ اللَّهُ فِيكَ ','مجهودٌ رائِعْ ','سلمتْ يداكَ '];
  List<String> LoseWords=['لا تَحْزنْ أَعِدْ المُحَاوَلَةْ','لا تَفْقِدْ الْأَمَلْ','اسْتَمِرْ في الْمُحَاوَلَة سَتَنْجحْ ','لَا تستسلمْ حَاوَل مَرَّة أُخْرَى '];
  List<String> LoseProWords=['أسوأ مِن الفَاشِلْ منْ لا يُحَاولْ النجاحْ'];
  Random random =Random();



  late TextToSpeech tts ;
  Future<void> speak({required String text}) async {
    tts.setVolume(1.00);
    tts.setRate(0.93);
    tts.setLanguage('ar');
    tts.setPitch(1.44);
    await tts.speak(text);
  }

  void SliderProgress({required double progressValue}){
    sliderProgressValue -= progressValue;
    notifyListeners();
  }


  void increaseLevelIndex(){
    levelindex=levelindex+1;
    notifyListeners();
  }
  Future<void> moveToNextGame ({required BuildContext context,var page,}) async {
    levelForminitPage--;
    print('Provider levelForminitPage : $levelForminitPage');
    if(levelForminitPage<0){
      levelComplete=true;
      notifyListeners();
      levelForminitPage=0;
      startPageInitController=0;
      losepage = false;
      await speak(text: '${WinWords[random.nextInt(WinWords.length)]}'+'$name');
      winpage=true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 5));
      winpage=false;
      SliderProgress(progressValue: 12);
      notifyListeners();
        await navigationKey.currentContext!
            .read<ProviderGameAnswer>()
            .PostAnswerGame(
            GameType: 'receptive', LevelNumber: levelMapGameIndex!);
        await navigationKey.currentContext!
            .read<ProviderGameAnswer>()
            .PostAnswerGame(
            GameType: 'expressive', LevelNumber: levelMapGameIndex!);
        if(levelMapGameIndex! >= 4){
          print('Enter Social Game');
          await navigationKey.currentContext!
              .read<ProviderGameAnswer>()
              .PostAnswerGame(
              GameType: 'social', LevelNumber: levelMapGameIndex!);
        }
        else print('you still Social Game ');

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartPage()));
      print('navigate to start page');
    }
    else{
      losepage = false;
      levelComplete=false;
      await speak(text: '${WinWords[random.nextInt(WinWords.length)]}'+'$name');
      winpage=true;
      SliderProgress(progressValue: 12);
      notifyListeners();
      await Future.delayed(Duration(seconds: 5));
      winpage=false;
      notifyListeners();
      levelFormTabController?.animateTo(levelForminitPage);
      print('move to next game');
    }
    notifyListeners();
  }

  Future<void> tryGameAgain() async {
    winpage=false;
    losepage=true;
    speak(text: '${LoseWords[random.nextInt(LoseWords.length)]}');
    //speak(text: '${LoseProWords[0]}');
    notifyListeners();
    await Future.delayed(Duration(seconds: 5));
    losepage=false;
    notifyListeners();
  }

  void startTalkWave({required bool talkWave}){
    talkbutton=talkWave;
    notifyListeners();
  }

  void Winpageselect ({required bool winpage}){
    this.winpage=winpage;
    losepage=false;
    notifyListeners();
  }

  void Losepageselect ({required losepage}){
    this.losepage=losepage;
    winpage=false;
    notifyListeners();
  }
}