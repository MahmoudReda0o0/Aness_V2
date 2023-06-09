import 'package:autism_app/ApiData/AnessData/Get/ReceptiveGame.dart';
import 'package:autism_app/ApiData/Models/ReceptiveModel.dart';
import 'package:flutter/material.dart';


class ProviderReceptiveGame extends ChangeNotifier {
  ReceptiveModel receptiveModel = ReceptiveModel();
  ApiReceptiveResult apiReceptiveResult = ApiReceptiveResult();
  //ApiServesesReceptiveGame apiServesesReceptiveGame = ApiServesesReceptiveGame();

  Future GetReceptiveData ({required int level}) async {
    try{
      apiReceptiveResult = await ApiServesesReceptiveGame().getReceptiveData(level: level);
      notifyListeners();
      if(apiReceptiveResult.hasError == false){
        receptiveModel = apiReceptiveResult.data!;
        print('data done');
        notifyListeners();
      }
      else{
        apiReceptiveResult.errorMessage ='Unable to load data';
        print('data error');
        notifyListeners();
      }
    }catch (e){
      print('catch provider error : ${e}');
      notifyListeners();
    }
    }

}