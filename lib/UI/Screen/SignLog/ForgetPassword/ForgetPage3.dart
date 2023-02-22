import 'package:autism_app/UI/Screen/SignLog/ForgetPassword/ForgetPasword.dart';
import 'package:autism_app/UI/Screen/SignLog/SignIn/signIn.dart';
import 'package:autism_app/UI/Widgets/FreeWidget.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

class ForgetPage3 extends StatefulWidget {
  const ForgetPage3({Key? key}) : super(key: key);

  @override
  State<ForgetPage3> createState() => _ForgetPage3State();
}

class _ForgetPage3State extends State<ForgetPage3> {
  TextEditingController _passController = TextEditingController();
  TextEditingController _rePassController = TextEditingController();
  bool _newPassBool = false;
  bool _reNewPassBool = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 35,
          // backgroundColor: Colors.black,
          child: Image.asset('assets/image/passicon2.png'),
        ),
        Center(
          child: Text(
            'اعادة تعيين كلمة السر  ',
            style: TextStyle(fontSize: 20, color: MyColor().pink),
          ),
        ),
        SizedBox(
          width: 400,
          child: Text(
            'قم بانشاء كلمة المرور الجديدة لتسجيل الدخول',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: MyColor().gray_white,
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              FreeWidget().textformfield(
                lableText: 'الرقم السري',
                controller: _passController,
                errorTitle: 'أعد ادخال الرقم السري',
                hintTitle: '* * * * * *',
                type: TextInputType.text,
                passwordMod: !_newPassBool,
                perfixicon: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        _newPassBool = !_newPassBool;
                      },
                    );
                  },
                  icon: _newPassBool
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FreeWidget().textformfield(
                lableText: 'تاكيد الرقم السري',
                controller: _rePassController,
                errorTitle: 'أعد ادخال الرقم السري',
                hintTitle: '* * * * * *',
                type: TextInputType.text,
                passwordMod: !_reNewPassBool,
                perfixicon: IconButton(
                  onPressed: () {
                    setState(
                          () {
                        _reNewPassBool = !_reNewPassBool;
                      },
                    );
                  },
                  icon: _reNewPassBool
                      ? Icon(
                    Icons.remove_red_eye,
                    color: Colors.blue,
                  )
                      : Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: MyColor().pink),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                selectPage = 0;
                tabController?.animateTo(0);
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => SignIn(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("تم تغير الرقم السري بنجاح "),
                  duration: Duration(seconds: 3),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("أعد ادخال كلمه السر "),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
          child: Container(
            height: 48,
            width: MyPageSize.width(context) * 0.9,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'تاكيد',
                style: TextStyle(fontSize: 14, color: MyColor().gray),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class ForgetPage3 {
//   TextEditingController _passController = TextEditingController();
//   TextEditingController _rePassController = TextEditingController();
//
//   body({required BuildContext context, required double width}) {
//     return
//   }
// }
