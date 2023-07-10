import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/App_Start_Page/UI/View/StartPage.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../../main.dart';

class DragTargetCustom extends StatefulWidget {
  DragTargetCustom({required this.image,required this.dataAnswer});

  String? image;
  String? dataAnswer;
  @override
  State<DragTargetCustom> createState() => _DragTargetCustomState();
}

class _DragTargetCustomState extends State<DragTargetCustom> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderLevelForm>(
      builder: (BuildContext context ,_, child){
        return Container(
          child: DragTarget<String>(
            onAccept: (data) async {
              if(data == widget.dataAnswer) {
                _.moveToNextGame(context: context,);
                print('winbool: ${_.winpage}');
              }
              else{
                _.tryGameAgain();
              };
              print(data);
            },
            builder: (context, _,__) => Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColor().gray_wihte2.withOpacity(0.5)
              ),
              height: 150,
              width: 150,
              child: Opacity(
                opacity: 0.4,
                child: Image.network('http://$PublicIP${widget.image}')
              ),
            ),
          ),
        );
      },
    );
  }
}
