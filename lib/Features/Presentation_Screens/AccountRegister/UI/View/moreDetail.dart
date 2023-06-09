import 'package:autism_app/Features/Presentation_Screens/AccountRegister/UI/View/RegisterEmailPass.dart';
import 'package:autism_app/zz_TestCode/MainPage.dart';

import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderAccountRegister.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/FreeWidget.dart';
import '../../../App_Start_Page/UI/View/StartPage.dart';

class MoreDetail extends StatefulWidget {
  State<StatefulWidget> createState() => MoreDetail_s();
}

class MoreDetail_s extends State<MoreDetail> {
  final _formKey = GlobalKey<FormState>();
  final _childNameController = TextEditingController();
  final _familyNameController = TextEditingController();
  bool _typeBoy = false;
  bool _typeGirl = false;
  bool _typeImage = false;
  bool _beforTypeImage = true;
  Widget build(BuildContext context) {
    final providerAccountRegister =
        Provider.of<ProviderAccountRegister>(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    if (providerAccountRegister.state == AccountRegisterState.initial ||
        providerAccountRegister.state == AccountRegisterState.error
        ) {
      return Scaffold(
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
                            _typeBoy = !_typeBoy;
                            _typeGirl = false;
                            _typeImage = true;
                            if (_typeBoy == false)
                              _beforTypeImage = true;
                            else
                              _beforTypeImage = false;
                          });
                        },
                        label: SizedBox(
                          height: 55,
                          width: _width * 0.25,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'ولد',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.boy,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:
                              _typeBoy ? MyColor().pink : MyColor().gray_white,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _typeGirl = !_typeGirl;
                            _typeBoy = false;
                            _typeImage = false;
                            if (_typeGirl == false)
                              _beforTypeImage = true;
                            else
                              _beforTypeImage = false;
                          });
                        },
                        label: SizedBox(
                          height: 55,
                          width: _width * 0.25,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'بنت',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.girl,
                          size: 30,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:
                              _typeGirl ? MyColor().pink : MyColor().gray_white,
                        ),
                      ),
                      // elevatedbutton(width: _width,typeText: 'ولد',baseType: _boyType,anotherType: _girlType),
                      // elevatedbutton(width: _width,typeText: "بنت",baseType: _girlType,anotherType: _boyType),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: _height * 0.3,
                    width: _width * 0.65,
                    //color: Colors.black,
                    child: _beforTypeImage
                        ? Image(image: AssetImage('assets/image/ghost.png'))
                        : _typeImage
                            ? Image(
                                image: AssetImage('assets/image/boytype.png'),
                                fit: FittedBox().fit,
                              )
                            : Image(
                                image: AssetImage('assets/image/girltype.png'),
                                fit: FittedBox().fit),
                  ),
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
                      )),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: FreeWidget().textformfield(
                          controller: _familyNameController,
                          errorTitle: 'اعد ادخال اسم العائلة ',
                          hintTitle: '',
                          lableText: 'أدخل اسم العائلة')),
                  SizedBox(
                    height: 30,
                  ),
                  Consumer<ProviderAccountRegister>(
                      builder: (BuildContext context, _, child) {
                    return ElevatedButton(
                      onPressed: () {
                        String username = _childNameController.text +
                            _familyNameController.text;
                        print('UserName => ${username}');
                        _.GetUserName(
                            fristname: _childNameController.text,
                            lastname: _familyNameController.text,
                            username: username);
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
                          _.PostData();
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
                          shadowColor: MyColor().gray, primary: MyColor().pink),
                      child: SizedBox(
                        height: 50,
                        width: _width * 0.85,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "التالي ",
                            style:
                                TextStyle(fontSize: 14, color: MyColor().gray),
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
      );
    }
   else if(providerAccountRegister.state == AccountRegisterState.loaded){
      return Scaffold(
        body:  Consumer<ProviderAccountRegister>(
            builder: (BuildContext context, _, child)  {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('FristName :${_.Fristname}'),
                Text(' Lastname:${_.Lastname}'),
                Text('Username :${_.Username}'),
                Text('Email :${_.Email}'),
                Text('Password :${_.Password}'),
                Text('Re_Password :${_.Re_Password}'),
                ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StartPage())), child: Icon(Icons.done))

              ],
            );
          }
        ),
      );
    }
      else
   {
      return Scaffold(
        body: Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
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
