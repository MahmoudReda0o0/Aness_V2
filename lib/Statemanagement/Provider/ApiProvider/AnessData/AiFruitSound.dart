import 'package:flutter/material.dart';

import 'dart:io';
import '../../../../ApiData/AnessData/Post/AiFruitSound.dart';
import '../../../../main.dart';


class ProviderAiSound extends ChangeNotifier{
  AiSoundResult aiSoundResult =AiSoundResult();
  AiSoundPredict aiFruitSound = AiSoundPredict();

  Future GetAiSoundResult ({required File audioFile,required String label}) async {
    try  {
      aiSoundResult = await aiFruitSound.PostFile(audioFile: audioFile, label: label);

      if(aiSoundResult.hasError==false){
        if(aiSoundResult.aiSoundModel!.result![0]=='passed'){
          aiSoundResult.levelComplete = true;
          print('provider ai sound levelcomplete : true');
          notifyListeners();
        }
        else {
          aiSoundResult.levelComplete = false;
          print('provider ai sound levelcomplete : false');
          notifyListeners();
        }
      }else{
        print('api result HasError= true');
      }
    }catch(e){
      print('Ai Sound Provider Catch Error: $e');
    }
  }

}