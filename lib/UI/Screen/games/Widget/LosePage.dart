import 'package:autism_app/UI/Widgets/TextCustom.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

class LosePage extends StatelessWidget {
  const LosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MyPageSize.height(context),
          width: MyPageSize.width(context),
          color: Colors.white.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image(
                    image: AssetImage('assets/image/games/lose.png'),
                  ),
                ),
              ),
              SizedBox(height: 80,),
              TextCustom(
                  title: 'حاول مره اخري', fontsize: 30, color: MyColor().pink)
            ],
          ),
        ),
        // Container(
        //   padding: EdgeInsets.only(top: 150, left: 40),
        //   child: Image(
        //     image: AssetImage('assets/image/games/win1.png'),
        //   ),
        // ),
      ],
    );
  }
}
