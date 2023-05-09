import 'package:autism_app/Features/MainPage.dart';

import 'package:autism_app/Core/constant.dart';
import 'package:flutter/material.dart';

import '../../../../Widgets/FreeWidget.dart';
import '../../../App_Start_Page/UI/View/StartPage.dart';

class MoreDetail extends StatefulWidget {
  State<StatefulWidget> createState() => MoreDetail_s();
}

class MoreDetail_s extends State<MoreDetail> {
  final _formKey = GlobalKey<FormState>();
  final _childNameController = TextEditingController();
  bool _typeBoy = false;
  bool _typeGirl = false;
  bool _typeImage = false;
  bool _beforTypeImage = true;
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
                SizedBox(height: 30,),
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
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
                SizedBox(height: 30,),
                Container(
                  height: _height*0.35,
                  width: _width*0.65,
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
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ما هو إسم طفلك ',
                    style: TextStyle(fontSize: 20, color: MyColor().pink),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: FreeWidget().textformfield(
                      controller: _childNameController,
                      errorTitle: 'اعد ادخال اسم الطفل ',
                      hintTitle: 'محمود مصطفي',
                      lableText: 'إسم الطفل ',
                    )),
                FreeWidget().elevatedTextField(
                    controller: _childNameController,
                    context: context,
                    buttonText: "التالي ",
                    page: StartPage(),
                    snackContent: 'أدخل اسم الطفل ',
                    buttonWidth: _width),
                SizedBox(height: 30,),
              ],
            )
          ],
        ),
      ),
    );
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
