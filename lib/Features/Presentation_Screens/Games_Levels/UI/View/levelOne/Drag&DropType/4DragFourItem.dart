import 'dart:math';

import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/WinPage.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../Widget/DragTargetCustom.dart';
import '../../../Widget/DragableCustom.dart';
import '../../../Widget/LosePage.dart';

class DragFourItem extends StatelessWidget {
  DragFourItem({required this.answerIndex,required this.fristImgIndex , required this.secondImgIndex,required this.thirdImagIndex,required this.fourImgIndex});
  int answerIndex;
  int fristImgIndex;
  int secondImgIndex;
  int thirdImagIndex;
  int fourImgIndex;
  // List<double> Xvector = [80,100,120,140,160,180];
  // List<double> Yvector = [60,80,90,100,120,140,160];
  // Random Xrandom = Random();
  // Random Yrandom = Random();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer2<ProviderLevelForm,ProviderReceptiveGame>(
          builder: (context,_,__,child) {
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
                        top: 100,
                        right:150,
                        child: DragTargetCustom(
                            dataAnswer: '${__.apiReceptiveResult.data!.answer}',
                            image: 'http://54.86.189.155${__.apiReceptiveResult.data!.images![answerIndex].img}'),
                      ),
                      Positioned(
                        bottom:230,
                        left: 30,
                        child: DragableCustom(
                          data: '${__.apiReceptiveResult.data!.images![fristImgIndex].name}',
                          image:
                          'http://54.86.189.155${__.apiReceptiveResult.data!.images![fristImgIndex].img}',
                        ),
                      ),
                      Positioned(
                        bottom:50,
                        left: 30,
                        child: DragableCustom(
                          data: '${__.apiReceptiveResult.data!.images![secondImgIndex].name}',
                          image:
                          'http://54.86.189.155${__.apiReceptiveResult.data!.images![secondImgIndex].img}',
                        ),
                      ),Positioned(
                        bottom:230,
                        right: 30,
                        child:DragableCustom(
                          data: '${__.apiReceptiveResult.data!.images![thirdImagIndex].name}',
                          image:
                          'http://54.86.189.155${__.apiReceptiveResult.data!.images![thirdImagIndex].img}',
                        ),
                      ),
                      Positioned(
                        bottom:50,
                        right: 30,
                        child: DragableCustom(
                          data: '${__.apiReceptiveResult.data!.images![fourImgIndex].name}',
                          image:
                          'http://54.86.189.155${__.apiReceptiveResult.data!.images![fourImgIndex].img}',
                        ),
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
