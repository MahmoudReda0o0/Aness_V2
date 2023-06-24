import 'package:autism_app/Features/Presentation_Screens/AccountRegister/UI/View/RegisterEmailPass.dart';
import 'package:autism_app/zz_TestCode/MainPage.dart';

import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderAccountRegister.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import '../../../../Widgets/FreeWidget.dart';
import '../../../App_Start_Page/UI/View/StartPage.dart';
import '../../../Login/UI/View/Login.dart';

class MoreDetail extends StatefulWidget {
  State<StatefulWidget> createState() => MoreDetail_s();
}

class MoreDetail_s extends State<MoreDetail> {
  final _formKey = GlobalKey<FormState>();
  final _childNameController = TextEditingController();
  final _familyNameController = TextEditingController();
  String Gender="M";
  bool _typeBoy = true;
  bool _typeGirl = false;
  // bool _typeImage = false;
  // bool _beforTypeImage = true;

  @override
  void initState(){
    Provider.of<ProviderAccountRegister>(context,listen: false).state = AccountRegisterState.initial;
  }
  Widget build(BuildContext context) {
    final providerAccountRegister =
        Provider.of<ProviderAccountRegister>(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    return Consumer<ProviderAccountRegister>(builder: (context, _, child) {
      if (providerAccountRegister.state == AccountRegisterState.initial) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    child: const Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/backscreen.png'),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        buttonHeight: 55,
                        buttonMinWidth: 150,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _typeBoy = true;
                                Gender='M';
                                _typeGirl = false;
                                // _typeBoy = !_typeBoy;
                                // _typeGirl = false;
                                // _typeImage = true;
                                // if (_typeBoy == false)
                                //   _beforTypeImage = true;
                                // else
                                //   _beforTypeImage = false;
                              });
                            },
                            label: SizedBox(
                              height: 55,
                              width: _width * 0.25,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'ولد',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.boy,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: _typeBoy
                                  ? MyColor().pink
                                  : MyColor().gray_white,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _typeGirl = true;
                                Gender='Q';
                                _typeBoy = false;
                                // _typeGirl = !_typeGirl;
                                // _typeBoy = false;
                                // _typeImage = false;
                                // if (_typeGirl == false)
                                //   _beforTypeImage = true;
                                // else
                                //   _beforTypeImage = false;
                              });
                            },
                            label: SizedBox(
                              height: 55,
                              width: _width * 0.25,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'بنت',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.girl,
                              size: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: _typeGirl
                                  ? MyColor().pink
                                  : MyColor().gray_white,
                            ),
                          ),
                          // elevatedbutton(width: _width,typeText: 'ولد',baseType: _boyType,anotherType: _girlType),
                          // elevatedbutton(width: _width,typeText: "بنت",baseType: _girlType,anotherType: _boyType),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      (keyboard == 0)
                          ? Container(
                              height: _height * 0.3,
                              width: _width * 0.65,
                              child: _typeBoy
                                  ? Image(
                                      image: AssetImage(
                                          'assets/image/boytype.png'),
                                      fit: FittedBox().fit,
                                    )
                                  : Image(
                                      image: AssetImage(
                                          'assets/image/girltype.png'),
                                      fit: FittedBox().fit,
                                    )

                              // child: _beforTypeImage
                              //     ? Image(
                              //         image: AssetImage('assets/image/ghost.png'),
                              //       )
                              //     : _typeImage
                              //         ? Image(
                              //             image: AssetImage('assets/image/boytype.png'),
                              //             fit: FittedBox().fit,
                              //           )
                              //         : Image(
                              //             image:
                              //                 AssetImage('assets/image/girltype.png'),
                              //             fit: FittedBox().fit,
                              //           ),
                              )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'ما هو إسم طفلك ',
                          style: TextStyle(fontSize: 20, color: MyColor().pink),
                        ),
                      ),
                      Center(
                        child: Text('${keyboard}'),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: FreeWidget().textformfield(
                          controller: _childNameController,
                          errorTitle: 'اعد ادخال اسم الطفل ',
                          hintTitle: '',
                          lableText: 'أدخل اسم الطفل ',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: FreeWidget().textformfield(
                            controller: _familyNameController,
                            errorTitle: 'اعد ادخال اسم العائلة ',
                            hintTitle: '',
                            lableText: 'أدخل اسم العائلة'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Consumer<ProviderAccountRegister>(
                          builder: (BuildContext context, _, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            String username =
                                '${_childNameController.text} ${_familyNameController.text}';
                            print('UserName => ${username}');
                            _.GetUserName(
                              fristname: _childNameController.text,
                              lastname: _familyNameController.text,
                              username: username,
                              gender: Gender,
                            );
                            // if(providerAccountRegister.state == AccountRegisterState.error){
                            //   print('Now State = Error: ${providerAccountRegister.state}');
                            // }
                            // if(providerAccountRegister.state == AccountRegisterState.loaded){
                            //   print('Now State = Loaded: ${providerAccountRegister.state}');
                            // }
                            // else(print('Now State : ${providerAccountRegister.state}'));
                            if (_.getusernameerror == true) {
                              FreeWidget().snackbar(
                                  context: context,
                                  content: 'أعد ادخال اسم الطفل و اسم العائلة',
                                  duration: 5);
                            } else {
                              await _.PostData();
                              // if(_.postdataDone== false){
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => RegisterEmailPass(),
                              //     ),
                              //   );
                              // }
                              _.postdataDone
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StartPage(),
                                      ),
                                    )
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterEmailPass(),
                                      ),
                                    );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shadowColor: MyColor().gray,
                              primary: MyColor().pink),
                          child: SizedBox(
                            height: 50,
                            width: _width * 0.85,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "التالي ",
                                style: TextStyle(
                                    fontSize: 14, color: MyColor().gray),
                              ),
                            ),
                          ),
                        );
                      }),
                      // FreeWidget().elevatedTextField(
                      //     controller: _childNameController,
                      //     context: context,
                      //     buttonText: "التالي ",
                      //     page: StartPage(),
                      //     snackContent: 'أدخل اسم الطفل ',
                      //     buttonWidth: _width),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      } else if (providerAccountRegister.state == AccountRegisterState.error) {
        return RegisterEmailPass();
      } else if (providerAccountRegister.state == AccountRegisterState.loaded) {
        return Scaffold(
          body: Consumer<ProviderAccountRegister>(
              builder: (BuildContext context, _, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('FristName :${_.Fristname}'),
                Text(' Lastname:${_.Lastname}'),
                Text('Username :${_.Username}'),
                Text('Email :${_.Email}'),
                Text('Password :${_.Password}'),
                Text('Re_Password :${_.Re_Password}'),
                ElevatedButton(
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
                    child: Icon(Icons.done))
              ],
            );
          }),
        );
      } else {
        return Container(
          height: MyPageSize.height(context),
          width: MyPageSize.width(context),
          child: Center(
            child: Image.asset('assets/image/anessloading.gif'),
          ),
        );
      }
    });
  }

  Widget elevatedbutton(
      {required double width,
      required String typeText,
      required bool baseType,
      required bool anotherType}) {
    return ElevatedButton.icon(
      onPressed: () {
        int x = 0;
        print('change color');
        setState(() {
          print('setstate');
          x++;
          baseType = !baseType;
          anotherType = false;
        });
        print(x);
        print(baseType);
        print(anotherType);
      },
      label: SizedBox(
        height: 55,
        width: width * 0.25,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            typeText,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      icon: Icon(Icons.boy),
      style: ElevatedButton.styleFrom(
        primary: baseType ? MyColor().pink : MyColor().gray_white,
      ),
    );
  }
}
