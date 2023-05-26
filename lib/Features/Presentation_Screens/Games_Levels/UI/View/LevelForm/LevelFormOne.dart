import 'package:autism_app/Features/Presentation_Screens/Games_Levels/UI/Widget/LevelStarCustom.dart';
import 'package:autism_app/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../levelOne/Drag&DropType/1DragOneItem.dart';
import '../levelOne/Drag&DropType/2DragOneItem.dart';
import '../levelOne/Drag&DropType/3DragOneItem.dart';
import '../levelOne/Drag&DropType/4DragFourItem.dart';
import '../levelOne/Drag&DropType/SelectFruit.dart';
import '../levelThree/TalkToAnees.dart';
import '../levelTwo/RecordFruitName.dart';

class LevelForm extends StatefulWidget {
  const LevelForm({Key? key}) : super(key: key);

  @override
  State<LevelForm> createState() => _LevelFormState();
}

class _LevelFormState extends State<LevelForm> with TickerProviderStateMixin {
  // Provider<ProviderLevelFormOne>.of(con)tabController=Tabcontroller (
  // Tabsnumber:3,
  // initvalue: provider.initTabPage,
  // vesnc:this,
  // )
  @override
  void initState() {
    super.initState();
    setState(() {
      Provider.of<ProviderLevelForm>(context, listen: false).initTabPage = 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderLevelForm>(context).tabcontroller = TabController(
      length: 10,
      vsync: this,
      initialIndex: Provider.of<ProviderLevelForm>(context).initTabPage,
    );
    return Scaffold(
      body: Consumer<ProviderLevelForm>(
        builder: (context, ProviderLevel, child) {
          return Stack(
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
                      Container(
                        height: MyPageSize.height(context) * 0.07,
                        width: MyPageSize.width(context) * 0.8,
                        child: Row(children: [
                          LevelStarCustom(),
                          Text('${ProviderLevel.initTabPage}'),
                        ],)
                      ),
                      Container(
                        height: MyPageSize.height(context) * 0.89,
                        width: MyPageSize.width(context),
                        //color: Colors.blue,
                        child: TabBarView(
                          controller: ProviderLevel.tabcontroller,
                          children: [
                            TalkToAnees(),
                            RecordFruitName(),
                            DragFourItem(),
                            DragFourItem(),
                            DragThreeItem(),
                            DragThreeItem(),
                            DragTwoItem(),
                            DragTwoItem(),
                            DragOneItem(),
                            DragOneItem(),


                            // LevelOne(),
                            // LevelTwo(),
                            // LevelThree(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget LevelStar({
    required int starsize,
    //required bool starcolor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: starsize == 3 ? 70 : 40,
          color: MyColor().gray,
        ),
        Icon(
          Icons.star,
          size: starsize == 2 ? 70 : 40,
          color: starsize == 3 ? Colors.yellow : MyColor().gray,
        ),
        Icon(
          Icons.star,
          size: starsize == 1 ? 70 : 40,
          color:
              starsize == 2 || starsize == 3 ? Colors.yellow : MyColor().gray,
        ),
      ],
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
}
