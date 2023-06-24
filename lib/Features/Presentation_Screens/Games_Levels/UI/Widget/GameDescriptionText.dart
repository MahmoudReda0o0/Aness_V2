import 'package:flutter/cupertino.dart';

import '../../../../../Core/constant.dart';

class GameDescriptionText extends StatelessWidget {
  GameDescriptionText({required this.AnswerText,required this.LeftText,required this.RightText});
  String AnswerText;
  String LeftText;
  String RightText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$RightText',
        style: TextStyle(
            color: MyColor().gray,
            fontSize: 18,
            fontFamily: 'Alexandria'),
        children: [
          TextSpan(
            children: [],
            text: '${AnswerText}',
            style: TextStyle(
                color: MyColor().pink, fontSize: 20),
          ),
          TextSpan(
            children: [],
            text: '$LeftText',
            style: TextStyle(
                color: MyColor().gray, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
