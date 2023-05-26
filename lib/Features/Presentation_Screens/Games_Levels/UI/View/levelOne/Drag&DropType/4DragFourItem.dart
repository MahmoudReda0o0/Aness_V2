import 'dart:math';

import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/WinPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../Widget/DragTargetCustom.dart';
import '../../../Widget/DragableCustom.dart';
import '../../../Widget/LosePage.dart';

class DragFourItem extends StatelessWidget {
  List<double> Xvector = [20,40,80,100,120,140,160,180,200,220];
  List<double> Yvector = [50,60,80,90,100,120,140,160,170,180];
  Random Xrandom = Random();
  Random Yrandom = Random();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ProviderLevelForm>(
          builder: (context,_,child) {
            return Stack(
              children: [
                Container(
                  height: MyPageSize.height(context),
                  width: MyPageSize.width(context),
                  //color: Colors.red,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: MyPageSize.width(context),
                        //  color: Colors.deepPurple,
                        child: Center(child: Text('اسحب الفاكهة للظل المناسب لها',style: TextStyle(fontSize: 18,color: MyColor().gray),),),
                      ),
                      Positioned(
                        top: Yvector[Yrandom.nextInt(10)],
                        right:Xvector[Xrandom.nextInt(10)],
                        child: DragTargetCustom(),
                      ),
                      Positioned(
                        bottom:Yvector[Yrandom.nextInt(10)],
                        left: Xvector[Xrandom.nextInt(10)],
                        child: DragableCustom(data: 'Apple', image: 'Apple'),
                      ),
                      Positioned(
                        bottom:Yvector[Yrandom.nextInt(10)],
                        left: Xvector[Xrandom.nextInt(10)],
                        child: DragableCustom(data: 'Banana', image: 'Banana'),
                      ),Positioned(
                        bottom:Yvector[Yrandom.nextInt(10)],
                        left: Xvector[Xrandom.nextInt(10)],
                        child: DragableCustom(data: 'banana', image: 'Banana'),
                      ),
                      Positioned(
                        bottom:Yvector[Yrandom.nextInt(10)],
                        left: Xvector[Xrandom.nextInt(10)],
                        child: DragableCustom(data: 'banana', image: 'Banana'),
                      ),
                      //Positioned(bottom: 10,left: 50,child: DragableCustom(data: 'adsd',image: 'Mango',))
                    ],
                  ),
                ),
                Center(
                  child: _.winpage ? WinPage() : SizedBox(),
                ),
                Center(
                  child: _.losepage ? LosePage() : SizedBox(),
                ),
              ],
            );
          }
      ),
    );
  }
}
