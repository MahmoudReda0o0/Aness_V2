import 'dart:math';
import 'package:flutter/material.dart';

class SelecThree extends StatefulWidget {
  State<StatefulWidget> createState() => SelecThree_s();
}

List<String> colorNameList = ['احمر', 'اخضر','ازرق'];
List<int> colorIdList = [1, 2 , 3];

int? colorId;
int? color_user;
MaterialColor block_color = Colors.grey;
bool block_bool = false;
// color[rondom_color.nextInt(color.length)];

class SelecThree_s extends State<SelecThree> {
  @override
  void initState() {
    super.initState();
    colorId = 1;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 30),
          Text(
            'أختر اللون ${colorId} : ${colorNameList[colorId!-1]}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: [
                color_row(Colors.red, 1, Colors.green,2,Colors.blue , 3),
                SizedBox(
                  height: 80,
                ),
                // color_row(Colors.blue, 3, Colors.yellow, 4),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget color_row(
      MaterialColor color_one,
      int OneId,
      MaterialColor color_two,
      int TwoId,
      MaterialColor color_three,
      int threeId,
      ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            block(color_one, OneId,'ImageOneUrl'),
            block(color_two, TwoId,'ImageTwoUrl'),
          ],
        ),
        SizedBox(height: 80,),
        Center(child: block(color_three, threeId,'ImageTwoUrl'),)
      ],
    );
  }

  Widget block(MaterialColor color, int select,String ImageUrl) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          color_user = select;
          block_bool = !block_bool;
        }),
        print('user=> ${color_user}'),
        print('com => ${colorId}'),
        if (color_user == colorId)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('VICTORY'),
              ),
            ),
            setState(
                    () {
                  colorId = colorId!+1;
                }
              // colorIdList[colorIdRondom.nextInt(4)],
            ),
          }
        else
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('YOU DIED'),
            ),
          ),
      },
      child: Container(height: 120, width: 120, color: color,child: Center(child: Text('${select}'),),),
    );
  }
}
