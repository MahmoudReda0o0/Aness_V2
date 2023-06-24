import 'package:autism_app/ApiData/AnessData/Post/GameAnswer.dart';
import 'package:flutter/material.dart';


class ProviderGameAnswer extends ChangeNotifier{
  GameAnswer gameAnswer = GameAnswer();
  bool levelComplete = false;

  Future PostAnswerGame ({required String GameType,required int LevelNumber}) async {
    await gameAnswer.PostGameAnswer(GameType: GameType, LevelNumber: LevelNumber);
    notifyListeners();
    if(gameAnswer.LevelComplete== true){
      levelComplete = true;
      print('game $GameType level $LevelNumber is completed');
      notifyListeners();
    }
    else{
      levelComplete = false;
      print('game $GameType level $LevelNumber is not completed');
    }
  }
}