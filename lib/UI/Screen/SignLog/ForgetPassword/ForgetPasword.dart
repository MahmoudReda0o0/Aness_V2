import 'package:autism_app/UI/Screen/SignLog/ForgetPassword/ForgetPage2.dart';
import 'package:autism_app/UI/Screen/SignLog/ForgetPassword/ForgetPage3.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

import 'ForgetPage1.dart';

class ForgetPassWord extends StatefulWidget {
  State<StatefulWidget> createState() => ForgetPassWord_s();
}

class ForgetPassWord_s extends State<ForgetPassWord>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    final FormKey = GlobalKey<FormState>();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    TextEditingController _mailController = TextEditingController();
    int tabpage = 0;

    TabController _tabController =
        TabController(length: 3, vsync: this);
    return GestureDetector(
      onTap: () {
        setState(() => FocusScope.of(context).unfocus());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: const FittedBox(
                fit: BoxFit.fill,
                child: Image(
                  image: AssetImage('assets/image/backscreen.png'),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: MyColor().gray,
                        ))),
                Center(
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TabBar(
                      isScrollable: false,
                      indicatorColor: Colors.white60,
                      mouseCursor: MouseCursor.uncontrolled,
                      controller: _tabController,
                      labelColor: MyColor().pink,
                      unselectedLabelColor: MyColor().pink_white,
                      splashBorderRadius: BorderRadius.circular(20),
                      tabs: const [
                        Tab(
                          icon: Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.remove_rounded,
                            size: 40,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.75,
                  //color: Colors.redAccent,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      ForgetPage1().body(context: context,controller: _mailController, width: _width),
                      ForgetPage2().body(context: context, width: _width),
                      ForgetPage3().body(context: context,width: _width),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget contasdc(TabController ttt) {
  //   return SizedBox(
  //     height: 300,
  //     width: 300,
  //     //color: Colors.redAccent,
  //     child: TabBarView(
  //       physics: NeverScrollableScrollPhysics(),
  //       controller: ttt,
  //       children: const [
  //         Center(
  //           child: Icon(Icons.ac_unit_rounded),
  //         ),
  //         Center(
  //           child: Icon(Icons.add_circle),
  //         ),
  //         Center(
  //           child: Icon(Icons.account_balance),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget VER_Code() {
  //   return Container(
  //     height: 50,
  //     width: 50,
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.black12),
  //         borderRadius: BorderRadius.circular(8)),
  //   );
  // }
}
