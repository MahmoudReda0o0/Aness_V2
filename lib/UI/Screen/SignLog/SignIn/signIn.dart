import 'package:autism_app/UI/Screen/SignLog/LogIn/LogIn.dart';
import 'package:autism_app/UI/Screen/StartPage/StartPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/FreeWidget.dart';
import '../../../helper/constant.dart';
import '../../Test/otpCode.dart';
import '../ForgetPassword/ForgetPasword.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignIn_state();
  }
}

class SignIn_state extends State<SignIn> {
  bool _rememberIcon = false;
  bool _passEye = false;
  final _formKey = GlobalKey<FormState>();
  bool _checkBox = false;
  String _rememberMe = 'remember me';
  bool? _sharedValue;
  final _emailConntroller = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //shared_GetData();
    //shared_Navicator();
  }

  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // backgroundColor: Colors.white30,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/image/backscreen.png'),
              ),
            ),
            Container(
              height: _height,
              width: _width,
              color: Colors.black.withOpacity(0.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/image/signicon.png'),
                ),
                Text(
                  'تسجيل الدخول ',
                  style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 16,
                      color: MyColor().pink),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FreeWidget().textformfield(
                            controller: _emailConntroller,
                            errorTitle: 'أعد ادخال البريد الإلكتروني ',
                            hintTitle: 'Example@gmail.com',

                          lableText: 'البريد الإلكتروني'
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FreeWidget().textformfield(
                          lableText: 'الرقم السري',
                          controller: _passwordController,
                          errorTitle: 'أهد ادخال الرقم السرى',
                          hintTitle: '******* ',
                          passwordMod: !_passEye,
                          type: TextInputType.number,
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
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext) => StartPage(),
                        ),
                      );
                    } else {
                      FreeWidget().snackbar(
                          context: context,
                          content: 'اعد ادخال البيانات صحيحة',
                          duration: 2);
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
                        'تسجيل الدخول ',
                        style: TextStyle(fontSize: 14, color: MyColor().gray),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          print('open ForgetPassword Page');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassWord()));
                        },
                        child: Text(
                          'نسيت كلمة المرور ؟',
                          style: TextStyle(fontSize: 14, color: MyColor().gray),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() => _rememberIcon = !_rememberIcon);
                          print('remember me');
                        },
                        label: Text(
                          'تذكرني',
                          style: TextStyle(fontSize: 14, color: MyColor().gray),
                        ),
                        icon: _rememberIcon
                            ? Icon(
                                Icons.check_box,
                                color: MyColor().pink,
                              )
                            : Icon(
                                Icons.check_box_outline_blank_sharp,
                                color: MyColor().gray_white,
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 350,
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => FreeWidget().snackbar(
                            context: context,
                            content: 'Sign in with Face Account',
                            duration: 2),
                        child: CircleAvatar(
                          child: Image(
                            image: AssetImage('assets/image/faceicon.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () => FreeWidget().snackbar(
                            context: context,
                            content: 'Sign in with Gmail Account',
                            duration: 2),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image(
                            image: AssetImage('assets/image/gmail.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Open Log In Screen');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogIn()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'لا تملك حساب ؟ ',
                      style: TextStyle(
                          color: MyColor().gray,
                          fontSize: 14,
                          fontFamily: 'Alexandria'),
                      children: [
                        TextSpan(
                          children: [],
                          text: 'سجل الان',
                          style: TextStyle(color: MyColor().pink, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
