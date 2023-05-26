import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/constant.dart';
import '../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';

class LevelStarCustom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderLevelForm>(
      builder: (BuildContext context , _ , child){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: _.winpage?60:40,
              color: _.winpage?Colors.yellow:Colors.grey,
            ),
            // Icon(
            //   Icons.star,
            //   size: starsize==2?70:40,
            //   color: starsize==3?Colors.yellow:MyColor().gray,
            // ),
            // Icon(
            //   Icons.star,
            //   size: starsize==1?70:40,
            //   color: starsize==2||starsize==3?Colors.yellow:MyColor().gray,
            // ),
          ],
        );
      },

    );
  }
}
