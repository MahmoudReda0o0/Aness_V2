import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/LevelStarCustom.dart';
import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/OfflineMode/Ui/view/OfflineGame.dart';
import 'package:autism_app/Features/Widgets/FreeWidget.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ExpressiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/GameAnswer.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_to_speech/text_to_speech.dart';
import '../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../../../main.dart';
import '../../../../../Widgets/TextCustom.dart';
import '../../Widget/SliderProgressCustom.dart';
import '../levelOne/Drag&DropType/1DragOneItem.dart';
import '../levelOne/Drag&DropType/2DragOneItem.dart';
import '../levelOne/Drag&DropType/3DragOneItem.dart';
import '../levelOne/Drag&DropType/4DragFourItem.dart';
import '../levelOne/SelectItem/SelectFruit.dart';
import '../levelThree/TalkToAnees.dart';
import '../levelTwo/RecordFruitName.dart';

class LevelForm extends StatefulWidget {
  LevelForm(
      {required this.GamesList,
      required this.levelindex,
      required this.initTapconPage,
      required this.tabConLength});
  List<Widget> GamesList;
  int initTapconPage;
  int tabConLength;
  int levelindex;

  @override
  State<LevelForm> createState() => _LevelFormState();
}

class _LevelFormState extends State<LevelForm> with TickerProviderStateMixin {
  TextEditingController conName = TextEditingController();
  // Provider<ProviderLevelFormOne>.of(con)tabController=Tabcontroller (
  // Tabsnumber:3,
  // initvalue: provider.initTabPage,
  // vesnc:this,
  // )
  @override
  void initState() {
    super.initState();
    setState(() {
      final providerlevel = Provider.of<ProviderLevelForm>(context,listen: false);
      providerlevel.levelMapGameIndex = widget.levelindex;
      providerlevel.name ='يا ${ Provider.of<ProviderChildProfile>(context,listen: false).childProfileResult!.childProfileModel!.userInfo!.firstName!}ْ';
      providerlevel.tts =
          TextToSpeech();
      speak(text: '');
      providerlevel
          .sliderProgressValue = 100;
      providerlevel.levelForminitPage =
          widget.initTapconPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderLevelForm>(context).levelFormTabController =
        TabController(
      length: widget.tabConLength,
      vsync: this,
      initialIndex: Provider.of<ProviderLevelForm>(context).levelForminitPage,
    );
    return Consumer4<ProviderLevelForm, ProviderReceptiveGame,
        ProviderExpressiveGame, ProviderGameAnswer>(
      builder: (context, _, _R, _E, _A, child) {
        _.levelindex = widget.levelindex;
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // double h = MediaQuery.of(context).size.height;
          //     // double w = MediaQuery.of(context).size.width;
          //     // print('h : $h');
          //     // print('w : $w');
          //     showDialog(
          //       context: context,
          //       builder: (context) => AlertDialog(
          //         title: Column(
          //           children: [
          //             TextCustom(
          //                 title:
          //                     'Receptive Data : ${_R.apiReceptiveResult.responseData}',
          //                 fontsize: 10,
          //                 color: Colors.black),
          //             TextCustom(
          //               title:
          //                   'Expressive Data : ${_E.apiExpressiveResult.responseData}',
          //               color: Colors.black,
          //               fontsize: 20,
          //             ),
          //             //Text('Start Page init: ${_.startPageInitController}'),
          //             Text('Level index : ${_.levelindex}'),
          //             Text('Game index : ${_.levelForminitPage}'),
          //             TextField(
          //               controller: conName,
          //               decoration: InputDecoration(hintText: 'أدخل اسم الطفل'),
          //             ),
          //             ElevatedButton(
          //               onPressed: () {
          //                 String childname = conName.text + 'ْ ';
          //                 print(childname);
          //                 _.ChildName(childName: childname);
          //                 Navigator.pop(context);
          //               },
          //               child: Center(
          //                 child: Text('Save Name'),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          //   child: FlutterLogo(),
          // ),
          body: Stack(
            children: [
              Container(
                height: MyPageSize.height(context),
                width: MyPageSize.width(context),
                child: Image(
                  image: AssetImage('assets/image/games/vegetables.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              SafeArea(
                child: Container(
                  height: MyPageSize.height(context),
                  width: MyPageSize.width(context),
                  color: Colors.white.withOpacity(0.1),
                  child: Column(
                    children: [
                      //Text('${_.slider}'),
                      Container(
                        height: MyPageSize.height(context) * 0.07,
                        width: MyPageSize.width(context) * 0.8,
                        child: SliderProgressCustom(),
                      ),
                      Container(
                        height: MyPageSize.height(context) * 0.89,
                        width: MyPageSize.width(context),
                        //color: Colors.blue,
                        child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _.levelFormTabController,
                            children: widget.GamesList),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget LevelStar({
  //   required int levelProgress,
  //   required bool starbool,
  // }) {
  //   return Icon(
  //     Icons.star,
  //     size: Provider.of<ProviderLevelFormOne>(context).LevelProgress ==
  //             levelProgress
  //         ? 70
  //         : 40,
  //     color: starbool ? Colors.yellow : MyColor().gray,
  //   );
  // }
  @override
  Future<void> dispose() async {
    super.dispose();
    print(
        'last Game index : ${navigationKey.currentContext!.read<ProviderLevelForm>().levelForminitPage}');
    print(
        'dispose LeveComplete : ${navigationKey.currentContext!.read<ProviderLevelForm>().levelComplete}');

    print('level Form Dispose');
    // Post AnswerRequest depend on LevelIndex
  }
}
