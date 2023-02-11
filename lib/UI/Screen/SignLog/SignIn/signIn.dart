// import 'package:flutter/material.dart';
//
// class SignIn extends StatelessWidget{
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In '),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//           height: 300,
//           width: 300,
//           color: Colors.green,
//         ),
//       ),
//     );
//   }
// }

import 'package:autism_app/UI/Screen/StartPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/FreeWidget.dart';
import '../../../helper/constant.dart';

class SignIn extends StatefulWidget {
  State<StatefulWidget> createState() {
    return SignIn_state();
  }
}

class SignIn_state extends State<SignIn> {
  bool _rememberIcon = true;
  bool _passEye = false;
  final _formKey = GlobalKey<FormState>();
  bool _checkBox = false;
  String _rememberMe = 'remember me';
  bool? _sharedValue;
  var _emailConntroller = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //shared_GetData();
    //shared_Navicator();
  }

  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.white30,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              child: Image(
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
                SizedBox(
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
                      color: Colors.redAccent[100]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          child: Text(
                            'البريد الالكتروني ',
                            style:
                                TextStyle(fontSize: 12, color: MyColor().gray),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FreeWidget().textformfield(
                            controller: _emailConntroller,
                            errorTitle: 'اعد ادخال البريد الإلكتروني ',
                            hintTitle: 'Example@gmail.com'),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'الرقم السري',
                              style: TextStyle(
                                  fontSize: 12, color: MyColor().gray),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        FreeWidget().textformfield(
                          controller: _passwordController,
                          errorTitle: 'أهد ادخال الرقم السري',
                          hintTitle: '******* ',
                          passwordMod: !_passEye,
                          type: TextInputType.number,
                          child: IconButton(
                              onPressed: () {
                                setState(() => _passEye = !_passEye);
                              },
                              icon: _passEye
                                  ? Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blue,
                                    )
                                  : Icon(Icons.remove_red_eye_outlined)),
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
                              builder: (BuildContext) => StartPage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('invalid User name or Password')));
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
                        },
                        child: Text(
                          'نسيت كلمه المرور ؟',
                          style: TextStyle(fontSize: 14, color: MyColor().gray),
                        ),
                      ),
                      TextButton.icon(
                          onPressed: () {
                            setState(() => _rememberIcon = !_rememberIcon);
                            print('remember me');
                          },
                          label: Text(
                            'تذكرني؟',
                            style:
                                TextStyle(fontSize: 14, color: MyColor().gray),
                          ),
                          icon: _rememberIcon
                              ? Icon(
                                  Icons.check_box,
                                  color: MyColor().pink,
                                )
                              : Icon(
                                  Icons.check_box_outline_blank_sharp,
                                  color: MyColor().gray_white,
                                )),
                    ],
                  ),
                ),
                SizedBox(
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
                      CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/image/faceicon.png'),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image(
                          image: AssetImage('assets/image/gmail.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'لا تملك حساب ؟ سجل الان',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
