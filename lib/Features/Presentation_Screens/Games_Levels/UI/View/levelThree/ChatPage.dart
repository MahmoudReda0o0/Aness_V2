
import 'package:autism_app/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../../Widgets/TextCustom.dart';
import '../../../../App_Start_Page/UI/View/StartPage.dart';
import '../../Widget/WinPage.dart';
import '../../Widget/gameBackImage.dart';



class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int chatState = 0;
  bool buttonChild = false;
  bool winpage = false;
  @override
  void initState() {
    chatState = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyPageSize.height(context),
      width: MyPageSize.width(context),
      color: Colors.white,
      child: Stack(
        children: [
          GameBackImage(),
          Container(
            height: MyPageSize.height(context),
            width: MyPageSize.width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextCustom(
                  title: 'أكمل الحوار مع صديقك أنيس',
                  fontsize: 14,
                  color: MyColor().gray,
                ),
                ChatAnees(
                    context: context,
                    visible: chatState == 1 ||
                        chatState == 2 ||
                        chatState == 3 ||
                        chatState == 4,
                    chatimage: 'chat1',
                    alignmentGeometry: Alignment.centerRight),
                ChatAnees(
                  context: context,
                  chatimage: 'chat2',
                  visible: chatState == 2 || chatState == 3 || chatState == 4,
                  alignmentGeometry: Alignment.centerLeft,
                ),
                ChatAnees(
                    context: context,
                    chatimage: 'chat3',
                    visible: chatState == 3 || chatState == 4,
                    alignmentGeometry: Alignment.centerRight),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 100,
                    width: 220,
                    child: ChatAnees(
                      context: context,
                      chatimage: 'chat4',
                      visible: chatState == 4,
                      alignmentGeometry: Alignment.centerLeft,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  buttonChild = true;
                });
                await Future.delayed(Duration(seconds: 1));
                setState(() {
                  chatState++;
                  buttonChild = false;
                });
                if (chatState == 5) {
                  setState(() {
                    winpage = true;
                  });
                  await Future.delayed(Duration(seconds: 5));
                  setState(() {
                    Provider.of<ProviderLevelForm>(context,listen: false).startPageInitController=0;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => StartPage()));

                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: MyColor().pink,
                  )),
              child: Container(
                height: 50,
                width: MyPageSize.width(context) * 0.8,
                child: Center(
                  child: buttonChild
                      ? chatState == 1 || chatState == 3
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/image/extra/voice.png'),
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/image/extra/voice.png'),
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/image/extra/voice.png'),
                                ),
                              ],
                            )
                          : Wrap(
                              children: [
                                TextCustom(
                                    title: 'اضغط للتحدث',
                                    fontsize: 17,
                                    color: MyColor().gray),
                                Icon(
                                  Icons.mic,
                                  size: 25,
                                  color: MyColor().gray,
                                ),
                              ],
                            )
                      : Wrap(
                          children: [
                            TextCustom(
                                title: 'اضغط للتحدث',
                                fontsize: 17,
                                color: MyColor().gray),
                            Icon(
                              Icons.mic,
                              size: 25,
                              color: MyColor().gray,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 150,
          //   left: 80,
          //   child: TextCustom(
          //     title: "الحمد لله",
          //     color: MyColor().gray,
          //     fontsize: 12,
          //   ),
          // ),
          Center(
            child: winpage ? WinPage() : SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget ChatAnees(
      {required BuildContext context,
      required bool visible,
      required String chatimage,
      required AlignmentGeometry alignmentGeometry}) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: MyPageSize.width(context),
        //color: Colors.pink,
        child: Align(
            alignment: alignmentGeometry,
            child: Image(
              image: AssetImage('assets/image/extra/${chatimage}.png'),
              fit: BoxFit.fitHeight,
            )),
      ),
    );
  }
}
