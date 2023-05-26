import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';

class DragTargetCustom extends StatefulWidget {
  const DragTargetCustom({Key? key}) : super(key: key);

  @override
  State<DragTargetCustom> createState() => _DragTargetCustomState();
}

class _DragTargetCustomState extends State<DragTargetCustom> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderLevelForm>(
      builder: (BuildContext context ,form, child){
        return Container(
          child: DragTarget<String>(
            onAccept: (data) async {
              if(data == form.DargItem) {
                print('Win');
                // _.DragBool=true;
                form.Winpageselect(winpage: true);
                print('winpage${form.winpage}');
               await  Future.delayed(Duration(seconds: 5));
                form.Winpageselect(winpage: false);
                form.tabcontroller?.animateTo(form.initTabPage--);
                print('winbool: ${form.winpage}');
              }
              else{
                form.Losepageselect(losepage: true);
                await Future.delayed(Duration(seconds: 5));
                form.Losepageselect(losepage: false);
                print('losebool: ${form.losepage}');
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
                child: Image(
                  image: AssetImage('assets/image/games/Apple.png'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
