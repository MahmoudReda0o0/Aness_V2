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

  LevelForm({required this.GamesList,required this.initTapconPage,required this.tabConLength});
  List<Widget> GamesList ;
  int initTapconPage ;
  int tabConLength;

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
      Provider.of<ProviderLevelForm>(context, listen: false).initTabPage = widget.initTapconPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderLevelForm>(context).levelFormTabController =
        TabController(
      length: widget.tabConLength,
      vsync: this,
      initialIndex: Provider.of<ProviderLevelForm>(context).initTabPage,
    );
    return Scaffold(
      body: Consumer<ProviderLevelForm>(
        builder: (context, _, child) {
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
                        child: LevelStarCustom(),
                      ),
                      Container(
                        height: MyPageSize.height(context) * 0.89,
                        width: MyPageSize.width(context),
                        //color: Colors.blue,
                        child: TabBarView(
                          controller: _.levelFormTabController,
                          children: widget.GamesList
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
