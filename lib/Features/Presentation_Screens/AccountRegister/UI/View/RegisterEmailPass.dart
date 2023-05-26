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
  bool _passEye = false;
  @override
  void initState() {
    super.initState();
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
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/image/signicon.png'),
                ),
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
                          hintTitle: 'Example@gmail.com',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FreeWidget().textformfield(
                          lableText: 'الرقم السرى',
                          controller: _passController,
                          errorTitle: 'أعد ادخال الرقم السري',
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
                Consumer<ProviderAccountRegister>(builder: (BuildContext context, _, child) {
                  return ElevatedButton(
                    onPressed: () {
                      _.GetEmail_Password(email: _emailController.text, password: _passController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreDetail()));
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
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 20,
                    width: 350,
                    child: Divider(
                      color: Colors.black26,
                    )),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // GestureDetector(
                      //   onTap: () => FreeWidget().snackbar(
                      //       context: context,
                      //       content: 'Sign in with Face Account',
                      //       duration: 2),
                      //   child: CircleAvatar(
                      //     child: Image(
                      //       image: AssetImage('assets/image/faceicon.png'),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        width: 30,
                      ),
                      // GestureDetector(
                      //   onTap: () => FreeWidget().snackbar(
                      //       context: context,
                      //       content: 'Sign in with Gmail Account',
                      //       duration: 2),
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.white,
                      //     radius: 25,
                      //     child: Image(
                      //       image: AssetImage('assets/image/gmail.png'),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    print('Open Sign In Screen');
                    Navigator.push(context,
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
                          style: TextStyle(color: MyColor().pink, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
