
import 'dart:io';
import 'package:autism_app/ApiData/AnessData/Post/AiFruitSound.dart';
import 'package:flutter/material.dart';
import '../../../../ApiData/AnessData/Get/ExpressiveGame.dart';
import '../../../../ApiData/Models/ExpressiveModel.dart';


class ProviderExpressiveGame extends ChangeNotifier {
  ExpressiveModel expressiveModel = ExpressiveModel();
  ApiExpressiveResult apiExpressiveResult = ApiExpressiveResult();
  //AiFruitSound aiFruitSound = AiFruitSound();

  Future GetExpressiveData ({required int level}) async {
    try{
      apiExpressiveResult = await ApiServesesExpressiveGame().getExpressiveData(level: level);
      notifyListeners();
      if(apiExpressiveResult.hasError == false){
        apiExpressiveResult.levelComplete=true;
        notifyListeners();
        expressiveModel = apiExpressiveResult.data!;
        print('Expressive Provider data done');
        notifyListeners();
      }
      else{
        apiExpressiveResult.levelComplete=false;
        notifyListeners();
        apiExpressiveResult.errorMessage ='Unable to load data';
        print('Expressive Provider data error');
        notifyListeners();
      }
    }catch (e){
      print('catch Expressive provider error : ${e}');
      notifyListeners();
    }
  }

  // Future PostAiFruitSound ({required File audioFile,required String label}) async {
  //   try{
  //     await aiFruitSound.PostFile(audioFile: audioFile, label: label);
  //     if(aiFruitSound.gameComplete==true){
  //       print('game Complete : true');
  //     }
  //     else{
  //       print('game Complete : false');
  //     }
  //   }catch(e){
  //     print('catch error : $e');
  //   }
  // }






}