import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/View/levelThree/widget/VideoPlay.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/SocialGame.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import 'package:autism_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Widgets/TextCustom.dart';
import '../../Widget/gameBackImage.dart';
import 'ChatPage.dart';

class TalkToAnees extends StatefulWidget {
  const TalkToAnees({Key? key}) : super(key: key);

  @override
  State<TalkToAnees> createState() => _TalkToAneesState();
}

class _TalkToAneesState extends State<TalkToAnees> {
 // late AnimationController _controller;
  bool iconPlay = false;
  bool chatPage = false;
  @override
  void initState() {
    super.initState();
    print('level index${navigationKey.currentContext!.read<ProviderLevelForm>().levelindex}');
    // _controller = AnimationController(
    //   duration: Duration(seconds: 1),
    //   vsync: this,
    // );
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                title: 'شاهد هذا الفيديو لعمل حوار ',
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
          SizedBox(
            height: 100,
          ),
          Container(
              height: MyPageSize.height(context) * 0.24,
              width: MyPageSize.width(context) * 0.87,
              //color: Colors.pink,
              child: VideoPlay()),
          SizedBox(
            height: 150,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: MyColor().pink,
            ),
            onPressed: (){
              videoController.pause();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
              // print(chatPage);
            },
            child: Container(
              height: MyPageSize.height(context) * 0.06,
              width: MyPageSize.width(context) * 0.85,
              child: Center(
                child: TextCustom(
                  title: 'اضغط للتحدث مع أنيس',
                  color: MyColor().gray,
                  fontsize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
