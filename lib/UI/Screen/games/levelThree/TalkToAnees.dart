import 'package:autism_app/UI/Widgets/TextCustom.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

import 'ChatPage.dart';

class TalkToAnees extends StatefulWidget {
  const TalkToAnees({Key? key}) : super(key: key);

  @override
  State<TalkToAnees> createState() => _TalkToAneesState();
}

class _TalkToAneesState extends State<TalkToAnees>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool iconPlay = false;
  bool chatPage=false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 35,
              width: MyPageSize.width(context) * 0.6,
              child: TextCustom(
                  title: 'شاهد هذا المحتوي لعمل حوار ',
                  fontsize: 15,
                  color: MyColor().gray),
            ),
            SizedBox(
              height: 30,
              width: MyPageSize.width(context) * 0.6,
              child: TextCustom(
                  title: ' مع صديقك أنيس',
                  fontsize: 15,
                  color: MyColor().gray),
            ),
            SizedBox(height: 100,),
            Container(
              height: MyPageSize.height(context) * 0.24,
              width: MyPageSize.width(context) * 0.87,
              //color: Colors.pink,
              child: Stack(
                children: [
                  SizedBox(
                    height: MyPageSize.height(context) * 0.23,
                    width: MyPageSize.width(context) * 0.87,
                    child: Image(
                      image: AssetImage('assets/image/playvideo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (iconPlay == false) {
                          _controller.forward();
                          setState(() {
                            iconPlay = true;
                          });
                        } else if (iconPlay == true) {
                          _controller.reverse();
                          setState(() {
                            iconPlay = false;
                          });
                        } else {
                          print('sdfvsdvsd');
                        }
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: MyColor().gray.withOpacity(0.8),
                        child: AnimatedIcon(
                          icon: AnimatedIcons.play_pause,
                          color: MyColor().pink,
                          size: 30,
                          progress: _controller,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: MyColor().pink,
              ),
              onPressed: () {
                setState(() {
                  chatPage=true;
                });
                print(chatPage);
              },
              child: Container(
                height: MyPageSize.height(context) * 0.06,
                width: MyPageSize.width(context) * 0.85,
                child: Center(
                  child: TextCustom(
                    title: 'التالي',
                    color: MyColor().gray,
                    fontsize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Center(
        child:chatPage?ChatPage():SizedBox() ,
        ),

    ],);
  }
}
