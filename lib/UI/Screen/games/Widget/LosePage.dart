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
            //padding: EdgeInsets.only(top: 80, left: 50),
            child: Image(
              image: AssetImage('assets/image/games/vegetables.png'),
            )
        ),
        Container(
          height: MyPageSize.height(context),
          width: MyPageSize.width(context),
          color: Colors.white.withOpacity(0.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 260,
                  width: 260,
                  child: Image(
                    image: AssetImage('assets/image/games/lose.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(child: TextCustom(title: 'لا تحزن يا أحمد',color: MyColor().gray,fontsize: 18),),
              SizedBox(height: 20,),
              Center(child: TextCustom(title: 'حاول مرة أخري لتفوز من جديد',color: MyColor().gray_white,fontsize: 18),),
              // Container(
              //   height: 60,
              //   width: MyPageSize.width(context) * 0.8,
              //   decoration: BoxDecoration(
              //     color: MyColor().gray.withOpacity(0.9),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Center(
              //     child: TextCustom(
              //         title: 'حاول مره اخري', fontsize: 30, color: MyColor().pink),
              //   ),
              // ),
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
