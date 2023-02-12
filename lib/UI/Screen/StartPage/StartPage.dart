import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  State<StatefulWidget> createState() => StartPage_s();
}

class StartPage_s extends State<StartPage> {
  Widget build(BuildContext context) {
    MyPageSize _pageSize = MyPageSize();
    return Scaffold(
      body: Stack(
        children: [

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
          // Column(
          //   children: [
          //     Expanded(flex:2,child: Center(
          //       child: ListTile(
          //
          //       ),
          //     )),
          //     Expanded(flex:8,child: Center()),
          //
          //   ],
          // ),
        ],
      ),
    );
  }
}
