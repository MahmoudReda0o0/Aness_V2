import 'package:autism_app/Features/Presentation_Screens/AccountRegister/UI/View/moreDetail.dart';
import 'package:autism_app/Features/Presentation_Screens/Login/UI/View/Login.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Core/constant.dart';
import '../../../../../Statemanagement/Provider/ApiProvider/Auth/ProviderAccountRegister.dart';
import '../../../../Widgets/FreeWidget.dart';
import '../../../Sign_in/UI/View/signIn.dart';

class RegisterEmailPass extends StatefulWidget {
  State<StatefulWidget> createState() {
    return RegisterEmailPass_s();
  }
}

class RegisterEmailPass_s extends State<RegisterEmailPass> {
  final _form_key = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passController = TextEditingController();
  var _repasswordController = TextEditingController();
  bool _passEye = false;
  bool _repassEye = false;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double keyboard = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        //FocusScope.of(context).unfocus();
      },
      child: Consumer<ProviderAccountRegister>(
          builder: (BuildContext context,_, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                child: const Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/image/backscreen.png'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  (keyboard==0)? Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/image/signicon.png'),
                  ):SizedBox(),
                  Text(
                    'إنشاء حساب جديد  ',
                    style: TextStyle(fontSize: 16, color: MyColor().pink),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Form(
                      key: _form_key,
                      child: Column(
                        children: [
                          FreeWidget().textformfield(
                            lableText: 'البريد الإلكترونى',
                            controller: _emailController,
                            errorTitle: 'اعد ادخال البريد الإلكتروني',
                            hintTitle: '',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FreeWidget().textformfield(
                            lableText: 'الرقم السرى',
                            controller: _passController,
                            errorTitle: 'يجب علي الأقل أن يكون خمس حروف',
                            hintTitle: '',
                            passwordMod: !_passEye,
                            type: TextInputType.text,
                            perfixicon: IconButton(
                              onPressed: () {
                                setState(() => _passEye = !_passEye);
                              },
                              icon: _passEye
                                  ? const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blue,
                                    )
                                  : Icon(Icons.remove_red_eye_outlined),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FreeWidget().textformfield(
                            controller: _repasswordController,
                            errorTitle: 'يجب علي الأقل أن يكون خمس حروف',
                            hintTitle: '',
                            lableText: 'أعد إدخال الرقم السري',
                            passwordMod: !_repassEye,
                            type: TextInputType.text,
                            perfixicon: IconButton(
                              onPressed: () {
                                setState(() => _repassEye = !_repassEye);
                              },
                              icon: _repassEye
                                  ? const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blue,
                                    )
                                  : Icon(Icons.remove_red_eye_outlined),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _.GetEmail_Password(
                        email: _emailController.text,
                        password: _passController.text,
                        re_password: _repasswordController.text,
                      );
                      _.getemailpasserror
                          ? FreeWidget().snackbar(
                              context: context,
                              content: 'تاكد من إدخال جميع البيانات',
                              duration: 5)
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoreDetail(),
                              ),
                            );
                      // if (_form_key.currentState!.validate()) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (BuildContext) => MoreDetail()));
                      // }
                      // else {
                      //   FreeWidget().snackbar(
                      //       context: context,
                      //       content: 'اعد ادخال البيانات صحيحة',
                      //       duration: 2);
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                        shadowColor: MyColor().gray, primary: MyColor().pink),
                    child: SizedBox(
                      height: 50,
                      width: _width * 0.85,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'إنشاء حساب جديد ',
                            style:
                                TextStyle(fontSize: 14, color: MyColor().gray),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                    width: 350,
                    child: Divider(
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Open Sign In Screen');
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'هل لديك حساب بالفعل؟ ',
                        style: TextStyle(
                            color: MyColor().gray,
                            fontSize: 14,
                            fontFamily: 'Alexandria'),
                        children: [
                          TextSpan(
                            text: 'تسجيل الدخول ',
                            style:
                                TextStyle(color: MyColor().pink, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: _.showErrorMessage
                        ? Text(
                            'من فضلك أعد إدخال البيانات صحيحة',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          )
                        : SizedBox(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
