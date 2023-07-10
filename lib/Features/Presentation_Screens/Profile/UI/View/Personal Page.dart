//import 'package:autism_app/UI/Screen/Sign_In_Screens/forget_password/1.RestoreWay.dart';
//import 'package:autism_app/UI/Screen/profile/ProfileSetting.dart';

import 'package:autism_app/ApiData/AnessData/Get/ExpressiveGame.dart';
import 'package:autism_app/ApiData/AnessData/Get/ReceptiveGame.dart';
import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Features/Presentation_Screens/Login/UI/View/Login.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../ApiData/AnessData/Get/ChildProfileApi.dart';
import '../../../../../ApiData/Models/ChildProfileModel.dart';
import '../../../../Widgets/FreeWidget.dart';
import 'Privacy.dart';
import 'ProfileSetting.dart';

class PresonalPage extends StatefulWidget {
  State<StatefulWidget> createState() => PersonalPage_s();
}

class PersonalPage_s extends State<PresonalPage> {
  double _sliderValue = 30;

  bool nnn = false;

  @override
  void initState() {
    super.initState();
    print('UI initState');
    //childData = ChildProfileApi().GetChildProfileData();
  }

  Widget build(BuildContext context) {
    //TabController _tabcontroller =TabController(length: 3, vsync: this);
    bool _checkVoive = false;
    bool _checkNoti = false;
    return Consumer<ProviderChildProfile>(builder: (context, _, child) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              FreeWidget().startPageBackImage(
                height: MyPageSize.height(context),
                width: MyPageSize.width(context),
              ),
              Column(
                children: [
                  Container(
                    height: MyPageSize.height(context) * 0.15,
                    width: MyPageSize.width(context),
                    child: Center(
                      child: Text(
                        'الصفحة الشخصية',
                        style: TextStyle(fontSize: 16, color: MyColor().gray),
                      ),
                    ),
                  ),
                  Container(
                    height: MyPageSize.height(context) * 0.8,
                    width: MyPageSize.width(context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileSetting(),
                              ),
                            );
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSetting()));
                          },
                          child: Container(
                            height: MyPageSize.height(context) * 0.08,
                            width: MyPageSize.width(context) * 0.95,
                            decoration: BoxDecoration(
                                color: MyColor().pink,
                                borderRadius: BorderRadius.circular(10),),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.pending_actions,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${_.childProfileResult!.childProfileModel!.userInfo!.username}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${_.childProfileResult!.childProfileModel!.userInfo!.email}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/image/profileimage.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MyPageSize.height(context) * 0.21,
                          width: MyPageSize.width(context) * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'المستوى ${_.childProfileResult!.childProfileModel!.currentLevel}',
                                    style: TextStyle(
                                        color: MyColor().gray_white,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: MyPageSize.width(context) * 0.4,
                                  ),
                                  Text(
                                    ' ${_sliderValue.toInt()} التقدم ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: MyColor().gray),
                                  )
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    trackHeight: 35,
                                    thumbColor: MyColor().pink,
                                    activeTrackColor: MyColor().pink,
                                    inactiveTrackColor: MyColor().pink_white,
                                    //trackShape: RectangularSliderTrackShape(),
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16,
                                        disabledThumbRadius: 0)),
                                child: Container(
                                  width: MyPageSize.width(context) * 0.95,
                                  child: Slider(
                                    min: 0,
                                    max: 100,
                                    value: _sliderValue,
                                    onChanged: (double value) {
                                      setState(() => _sliderValue = value);
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  container_all(
                                      height: MyPageSize.height(context),
                                      width: MyPageSize.width(context),
                                      //choose: true,
                                      size: 30,
                                      leading: '3 يوم',
                                      colorLeading: MyColor().gray,
                                      title: 'مدة التدريب',
                                      icon: Icons.account_balance,
                                      colorContainer: MyColor().gray_wihte2),
                                  container_all(
                                      height: MyPageSize.height(context),
                                      width: MyPageSize.width(context),
                                      //choose: true,
                                      size: 25,
                                      leading: '300',
                                      colorLeading: MyColor().gray,
                                      title: 'عدد التحديات',
                                      icon: Icons.alt_route_rounded,
                                      colorContainer: MyColor().gray_wihte2),
                                ],
                              )
                            ],
                          ),
                        ), //  التقدم
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: MyPageSize.height(context) * 0.15,
                          width: MyPageSize.width(context) * 0.95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 3)),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'الاحصائيات',
                                  style: TextStyle(
                                      fontSize: 16,
                                      //fontWeight: FontWeight.bold,
                                      color: MyColor().gray),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  container_all(
                                      // choose: true,
                                      height: MyPageSize.height(context),
                                      width: MyPageSize.width(context),
                                      size: 40,
                                      leading: '500',
                                      colorLeading: MyColor().gray,
                                      title: 'الكلمات',
                                      icon: Icons.wallet,
                                      colorContainer: MyColor().pink_white),
                                  container_all(
                                      height: MyPageSize.height(context),
                                      width: MyPageSize.width(context),
                                      // choose: true,
                                      size: 40,
                                      leading: '%70',
                                      colorLeading: MyColor().gray,
                                      title: 'الدقة',
                                      icon: Icons.add_circle,
                                      colorContainer: MyColor().pink_white),
                                ],
                              )
                            ],
                          ),
                        ), // الاحصائيات
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: MyPageSize.height(context) * 0.25,
                          width: MyPageSize.width(context) * 0.95,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 3)),
                            ],
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'الإعدادات',
                                  style: TextStyle(
                                    color: MyColor().gray,
                                    fontSize: 16,
                                    // fontStyle: FontStyle.italic,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => print("voice"),
                                child: container_setting(
                                    checkBool: _checkVoive,
                                    leading_check: true,
                                    title: 'الصوت',
                                    icon: Icons.keyboard_voice_outlined),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    setState(() => _checkNoti = !_checkNoti),
                                child: container_setting(
                                    checkBool: _checkNoti,
                                    leading_check: true,
                                    title: 'الإشعارات',
                                    icon: Icons.phonelink_ring),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Privacy()));
                                },
                                child: container_setting(
                                    checkBool: nnn,
                                    leading_check: false,
                                    title: "الخصوصية",
                                    icon_check: Icons.arrow_back_ios,
                                    color: Colors.black,
                                    icon: Icons.shield_moon_outlined),
                              ),
                              GestureDetector(
                                onTap: () => FreeWidget().snackbar(
                                    context: context,
                                    content: 'Exit',
                                    duration: 1),
                                child: container_setting(
                                    checkBool: nnn,
                                    leading_check: false,
                                    title: 'الخروج',
                                    icon_check: Icons.hourglass_empty,
                                    color: Colors.white,
                                    icon: Icons.exit_to_app),
                              )
                            ],
                          ),
                        ), // الاعدادات
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 20,
                left: 20,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() =>
                        Provider.of<ProviderLoginToken>(context, listen: false)
                            .state = LoginTokenState.pop);
                    print(
                        'state : ${Provider.of<ProviderLoginToken>(context, listen: false).state}');
                    // Provider.of<ProviderLoginToken>(context,listen: false).initalLoginPage();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: FlutterLogo(size: 20),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () async {
                    // await ApiServesesReceptiveGame().getReceptiveData(level: 1);
                    //ChildProfileResult childData =await ChildProfileApi().GetChildProfileData();
                    print('Ui print : $_');
                    print(
                        'Exp :${_.childProfileResult!.childProfileModel!.accuracy!.receptive}');
                    print(
                        'Res :${_.childProfileResult!.childProfileModel!.accuracy!.expressive}');
                    print(
                        'Social :${_.childProfileResult!.childProfileModel!.accuracy!.social}');
                    print(
                        'CurrentLevel :${_.childProfileResult!.childProfileModel!.currentLevel}');
                    print(
                        'userName :${_.childProfileResult!.childProfileModel!.userInfo!.username}');
                    print(
                        'email :${_.childProfileResult!.childProfileModel!.userInfo!.email}');
                    print(
                        'fristN :${_.childProfileResult!.childProfileModel!.userInfo!.firstName}');
                    print(
                        'Current level :${_.childProfileResult!.childProfileModel!.currentLevel}');
                  },
                  child: FlutterLogo(size: 20),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // Widget text_all(){
  //   return Text()
  // }
  Widget container_setting(
      {required bool leading_check,
      required bool checkBool,
      IconData? icon_check,
      required String title,
      required IconData icon,
      Color? color}) {
    return Container(
      width: 700,
      height: MyPageSize.height(context) * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          leading_check
              ? Checkbox(
                  value: checkBool,
                  onChanged: (bool? value) {
                    setState(() {
                      checkBool = value!;
                    });
                  })
              : Icon(
                  icon_check,
                  color: color,
                ),
          SizedBox(width: 200),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: MyColor().gray),
          ),
          Icon(
            icon,
            color: MyColor().pink,
          )
        ],
      ),
    );
  }

  Widget container_all({
    required double height,
    required double width,
    required double size,
    //required bool choose,
    required String title,
    required IconData icon,
    required Color colorContainer,
    required Color colorLeading,
    required String leading,
  }) {
    return Container(
      height: width * 0.13,
      width: height * 0.2,
      //margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: colorContainer,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3)),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            leading,
            style: TextStyle(fontSize: 15),
          ),
          // : SizedBox(
          //     height: 50,
          //     width: 50,
          //     child: child,
          //   ),
          //SizedBox(width: size),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: colorLeading,
              //fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic,
            ),
          ),
          //SizedBox(width: 10),
          Icon(icon)
        ],
      ),
    );
  }
}
