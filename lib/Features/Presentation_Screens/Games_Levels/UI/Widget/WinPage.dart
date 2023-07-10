import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/TextCustom.dart';

class WinPage extends StatelessWidget {
  const WinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderChildProfile>(
      builder: (context,_,child) {
        return Stack(
          children: [
            Container(
              height: MyPageSize.height(context),
              width: MyPageSize.width(context),
              //padding: EdgeInsets.only(top: 80, left: 50),
              color: Colors.white.withOpacity(0.9),
              child: Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage('assets/image/games/win1.gif'),
                ),
              )
            ),
            Container(
                height: MyPageSize.height(context),
                width: MyPageSize.width(context),
                //padding: EdgeInsets.only(top: 80, left: 50),
                child: Opacity(
                  opacity: 1,
                  child: Image(
                    image: AssetImage('assets/image/games/vegetables.png'),
                  ),
                )
            ),
            Container(
              height: MyPageSize.height(context),
              width: MyPageSize.width(context),
              //color: Colors.white.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 260,
                      width: 260,
                      child: Image(
                        image: AssetImage('assets/image/games/win.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(child: TextCustom(title: 'أحسنت يا ${ Provider.of<ProviderChildProfile>(context,listen: false).childProfileResult!.childProfileModel!.userInfo!.firstName!}',color: MyColor().gray,fontsize: 18),),
                  SizedBox(height: 20,),
                  Center(child: TextCustom(title: ' الإجابة صحيحة هيا بنا للعب المزيد',color: MyColor().gray_white,fontsize: 18),),
                  // Container(
                  //   height: 60,
                  //   width: MyPageSize.width(context) * 0.8,
                  //   decoration: BoxDecoration(
                  //     color: MyColor().gray.withOpacity(0.9),
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: Center(
                  //     child: TextCustom(
                  //         title: 'أحسنت يا أحمد',
                  //         fontsize: 30,
                  //         color: MyColor().pink),
                  //   ),
                  // )
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(top: 80, left: 50),
            //   child: Image(
            //     image: AssetImage('assets/image/games/win1.png'),
            //   ),
            //),
          ],
        );
      }
    );
  }
}
