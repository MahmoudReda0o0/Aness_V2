import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderLevelForm extends ChangeNotifier{
  int LevelProgress =2;
  TabController? tabcontroller ;
  TabController? levelmapTabController;
  int levelmapInitIndex=1;
  int initTabPage=2;
  bool starbool =false ;
  int levelindex=0;
  bool winpage =false;
  bool losepage=false;
  String DargItem = 'Apple';
  bool DragBool = false ;

  void Winpageselect ({required bool winpage}){
    this.winpage=winpage;
    losepage=false;
    notifyListeners();
  }
  // void WinPageFalse (){
  //   winpage=false;
  //   notifyListeners();
  // }

  void Losepageselect ({required losepage}){
    this.losepage=losepage;
    winpage=false;
    notifyListeners();
  }
  // void LosePageFalse(){
  //   losepage=false;
  //   notifyListeners();
  // }
}