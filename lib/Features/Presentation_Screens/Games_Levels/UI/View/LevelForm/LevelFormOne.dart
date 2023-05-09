import 'package:autism_app/Statemanagement/Provider/ProviderLevelFormOne.dart';
import 'package:autism_app/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../levelOne/SelectFruit.dart';
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
  void initState(){
    super.initState();
    setState(() {
      Provider.of<ProviderLevelFormOne>(context,listen: false).initTabPage=2;
    });
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderLevelFormOne>(context).tabcontroller = TabController(
      length: 3,
      vsync: this,
      initialIndex: Provider.of<ProviderLevelFormOne>(context).initTabPage,
    );
    return Scaffold(
      body: Consumer<ProviderLevelFormOne>(
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
                        height: MyPageSize.height(context) * 0.09,
                        width: MyPageSize.width(context) * 0.8,
                        //color: Colors.orange,
                        child: TabBarView(
                          controller: ProviderLevel.tabcontroller,
                          children: [
                            LevelStar(starsize: 3,starcolor: false),
                            LevelStar(starsize: 2,starcolor: false),
                            LevelStar(starsize: 1,starcolor: false),
                          ],
                        ),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     LevelStar(
                        //         levelProgress: 0,
                        //         starbool: ProviderLevel.starThree),
                        //     LevelStar(
                        //         levelProgress: 1,
                        //         starbool: ProviderLevel.starTwo),
                        //     LevelStar(
                        //         levelProgress: 2,
                        //         starbool: ProviderLevel.starOne),
                        //   ],
                        // ),
                      ),
                      Container(
                        height: MyPageSize.height(context) * 0.86,
                        width: MyPageSize.width(context),
                        //color: Colors.blue,
                        child: TabBarView(
                          controller: ProviderLevel.tabcontroller,
                          children: [

                            TalkToAnees(),
                            RecordFruitName(),
                            SelectFruit(),
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
    required bool starcolor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: starsize==3?70:40,
          color: MyColor().gray,
        ),
        Icon(
          Icons.star,
          size: starsize==2?70:40,
          color: starsize==3?Colors.yellow:MyColor().gray,
        ),
        Icon(
          Icons.star,
          size: starsize==1?70:40,
          color: starsize==2||starsize==3?Colors.yellow:MyColor().gray,
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
