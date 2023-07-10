import 'package:autism_app/ApiData/AnessData/Get/SocialGame.dart';
import 'package:flutter/material.dart';

class ProviderSocialGame extends ChangeNotifier{
  ApiResultSocial apiResultSocial = ApiResultSocial();
  ApiServisesSocialGame _apiServisesSocialGame= ApiServisesSocialGame();

  Future GetSocialGame ({required int level})async {
    try{
      apiResultSocial =await _apiServisesSocialGame.GetSocialGame(level: level);
      if(apiResultSocial.hasError== false){
        print('Provider Social Data Loaded');
        apiResultSocial.gameComplete=true;
        notifyListeners();
        print('Provider ${apiResultSocial.Message}');

      }else{
        print('Provider ${apiResultSocial.Message}');
        apiResultSocial.gameComplete=false;
        notifyListeners();
      }
    }catch(e){
      print('Provider Social Data Loaded');
    }
  }
}