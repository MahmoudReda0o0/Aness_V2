

import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderStartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../App_Instruction/UI/View/AppInformation.dart';
import '../../../Level_Map/UI/View/LevelMap.dart';
import '../../../Profile/UI/View/Personal Page.dart';

class StartPage extends StatefulWidget {
  State<StatefulWidget> createState() => StartPage_s();
}

class StartPage_s extends State<StartPage> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    Provider.of<ProviderStartPage>(context).startPageTapController =
        TabController(
      length: 3,
      vsync: this,
      initialIndex:
          Provider.of<ProviderLevelForm>(context).levelmapInitIndex,
    );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: MyPageSize.height(context),
              width: MyPageSize.width(context),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: Provider.of<ProviderStartPage>(context)
                    .startPageTapController,
                children: [
                  LevelMap(),
                  PresonalPage(),
                  AppInfo(),
                ],
              ),
            ),
            // Column(
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: Image(
            //         fit: BoxFit.fitWidth,
            //         image: AssetImage('assets/image/backscreen1.png'),
            //       ),
            //     ),
            //     Expanded(
            //       flex: 8,
            //       child: Image(
            //         fit: BoxFit.fitWidth,
            //         image: AssetImage('assets/image/backscreen.png'),
            //       ),
            //     ),
            //   ],
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MyPageSize.height(context) * 0.87,
                  width: MyPageSize.width(context),
                  //color: Colors.redAccent,
                ),
                Container(
                  height: MyPageSize.height(context) * 0.08,
                  width: MyPageSize.width(context) * 0.9,
                  decoration: BoxDecoration(
                    color: MyColor().pink,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                  ),
                  child: TabBar(
                    labelColor: Colors.white,
                    indicatorColor: MyColor().pink,
                    unselectedLabelColor: MyColor().gray_white,
                    controller: Provider.of<ProviderStartPage>(context)
                        .startPageTapController,
                    tabs: [
                      tabBarIcon(icons: Icons.house),
                      tabBarIcon(icons: Icons.person),
                      tabBarIcon(icons: Icons.library_books)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBarIcon({required IconData icons}) {
    return Icon(
      icons,
      //color: Colors.white,
      size: 40,
    );
  }
}
