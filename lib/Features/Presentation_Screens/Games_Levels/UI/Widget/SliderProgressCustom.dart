import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/constant.dart';

double sliderProgressValue = 30;

class SliderProgressCustom extends StatefulWidget {
  const SliderProgressCustom({Key? key}) : super(key: key);

  @override
  State<SliderProgressCustom> createState() => _SliderProgressCustomState();
}

class _SliderProgressCustomState extends State<SliderProgressCustom> {
  //double sliderProgressValue = 50;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderLevelForm>(builder: (context, _, child) {
      return SliderTheme(
        data: SliderTheme.of(context).copyWith(

          trackHeight: 35,
          thumbColor: MyColor().pink,
          activeTrackColor: MyColor().pink_white,
          inactiveTrackColor: MyColor().pink,
          //trackShape: RectangularSliderTrackShape(),
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 20,
            disabledThumbRadius: 0,
          ),
        ),
        child: Container(
          width: MyPageSize.width(context) * 0.95,
          child: Slider(
            label: '${_.sliderProgressValue}',
            min: 0,
            max: 100,
            value: _.sliderProgressValue,
            onChanged: (double value) {
              // setState(() {
              //   _.sliderProgressValue = value;
              // });
              // _.SliderIncrease(progressValue: 10);
            },
          ),
        ),
      );
    });
  }
}
