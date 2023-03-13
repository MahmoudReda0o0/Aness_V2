import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderLevelFormOne extends ChangeNotifier{
  String providernum='Provifer second';
  int LevelProgress =2;
  bool starOne= false;
  bool starTwo= false;
  bool starThree= false;
  TabController? tabcontroller ;
  TabController? levelmapTabController;
  int levelmapInitIndex=1;
  int initTabPage=2;
  int levelindex=0;
}