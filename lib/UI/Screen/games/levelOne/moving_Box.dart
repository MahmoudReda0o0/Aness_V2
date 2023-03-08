import 'dart:math';

import 'package:flutter/material.dart';

class MoveBox extends StatefulWidget {
  State<StatefulWidget> createState() => MoveBox_s();
}

Color coo = Colors.cyan;
List<String> color_list = ['احمر', 'ازرق', 'اصفر'];
Random color_rondom = Random();
String? color_select;
String? color_user;

class MoveBox_s extends State<MoveBox> {
  @override
  void initState() {
    super.initState();
    color_select = color_list[color_rondom.nextInt(color_list.length)];
    coo = Colors.black38;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('اختر اللون ${color_select}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            DragTarget<String>(
              onAccept: (data) {
                if (data == color_select) {
                  print('correct');
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Image(
                        image: AssetImage('asset/image/correct.png'),
                      ),
                    ),
                  ).then(
                    (value) => setState(
                      () => color_select =
                          color_list[color_rondom.nextInt(color_list.length)],
                    ),
                  );
                } else {
                  print('wrong');
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Image(
                              image: AssetImage('asset/image/wasted.png'),
                            ),
                          ));
                }
              },
              builder: (context, _, __) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: coo,
                ),
                height: 150,
                width: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Drad_Drop(
                    data: 'اصفر',
                    color_chi_data: Colors.yellow,
                    color_feedback: Colors.yellow),
                Drad_Drop(
                    data: 'احمر',
                    color_chi_data: Colors.red,
                    color_feedback: Colors.red),
                Drad_Drop(
                    data: 'ازرق',
                    color_feedback: Colors.blue,
                    color_chi_data: Colors.blue),
                // Draggable<MaterialColor>(
                //   data: Colors.yellow,
                //   child: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.yellow,
                //   ),
                //   feedback: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.green,
                //   ),
                //   childWhenDragging: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.red,
                //   ),
                // ),
                // Draggable<MaterialColor>(
                //   data: Colors.yellow,
                //   child: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.yellow,
                //   ),
                //   feedback: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.green,
                //   ),
                //   childWhenDragging: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.red,
                //   ),
                // ),
                // Draggable<MaterialColor>(
                //   data: Colors.yellow,
                //   child: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.yellow,
                //   ),
                //   feedback: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.green,
                //   ),
                //   childWhenDragging: Container(
                //     height: 150,
                //     width: 150,
                //     color: Colors.red,
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Drad_Drop({
    required String data,
    required MaterialColor color_chi_data,
    required MaterialColor color_feedback,
  }) {
    return Draggable<String>(
      data: data,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color_chi_data,
        ),
        height: 100,
        width: 100,
      ),
      feedback: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color_chi_data,
        ),
        height: 100,
        width: 100,
      ),
      childWhenDragging: Container(
        height: 100,
        width: 100,
        color: Colors.white30,
      ),
    );
  }
}
