

import 'package:flutter/material.dart';
import '../../../../ApiData/AnessData/Get/ExpressiveGame.dart';
import '../../../../ApiData/Models/ExpressiveModel.dart';


class ProviderExpressiveGame extends ChangeNotifier {
  ExpressiveModel expressiveModel = ExpressiveModel();
  ApiExpressiveResult apiExpressiveResult = ApiExpressiveResult();

  Future GetExpressiveData ({required int level}) async {
    try{
      apiExpressiveResult = await ApiServesesExpressiveGame().getExpressiveData(level: level);
      notifyListeners();
      if(apiExpressiveResult.hasError == false){
        expressiveModel = apiExpressiveResult.data!;
        print('Expressive Provider data done');
        notifyListeners();
      }
      else{
        apiExpressiveResult.errorMessage ='Unable to load data';
        print('Expressive Provider data error');
        notifyListeners();
      }
    }catch (e){
      print('catch Expressive provider error : ${e}');
      notifyListeners();
    }
  }

}