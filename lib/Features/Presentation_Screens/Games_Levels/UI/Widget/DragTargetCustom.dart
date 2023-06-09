import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';

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
                print('ansower Image :${widget.image}');
                print('Win');
                // _.DragBool=true;
                _.Winpageselect(winpage: true);
                print('winpage${_.winpage}');
               await  Future.delayed(Duration(seconds: 5));
                print('ansower Image :${widget.image}');
                _.Winpageselect(winpage: false);
                _.levelFormTabController?.animateTo(_.initTabPage--);
                print('winbool: ${_.winpage}');
              }
              else{
                print('ansower Image :${widget.image}');
                _.Losepageselect(losepage: true);
                await Future.delayed(Duration(seconds: 5));
                _.Losepageselect(losepage: false);
                print('losebool: ${_.losepage}');
              };
              print(data);
            },
            builder: (context, _,__) => Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColor().gray_wihte2.withOpacity(0.5)
              ),
              height: 140,
              width: 140,
              child: Opacity(
                opacity: 0.4,
                child: Image.network('${widget.image}')
              ),
            ),
          ),
        );
      },
    );
  }
}
