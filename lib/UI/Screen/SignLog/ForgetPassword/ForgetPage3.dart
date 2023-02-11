import 'package:autism_app/UI/Screen/SignLog/SignIn/signIn.dart';
import 'package:autism_app/UI/Widgets/FreeWidget.dart';
import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class ForgetPage3 {
  TextEditingController _passController = TextEditingController();
  TextEditingController _rePassController = TextEditingController();

  body({required BuildContext context, required double width}) {
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
                type: TextInputType.number,
                passwordMod: false,
                perfixicon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.blue,
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
                type: TextInputType.number,
                passwordMod: false,
                perfixicon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: MyColor().pink),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("تم تغير الرقم السري بنجاح "),
                duration: Duration(seconds: 3),
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => SignIn(),
              ),
            );
          },
          child: Container(
            height: 48,
            width: width * 0.9,
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
