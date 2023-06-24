import 'package:flutter/material.dart';

import '../../../../../Core/constant.dart';

class GameBackImage extends StatelessWidget {
  const GameBackImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      height: MyPageSize.height(context),
      width: MyPageSize.width(context),
      child: Image(
        image: AssetImage('assets/image/games/vegetables.png'),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
