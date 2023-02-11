import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreeWidget {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbar(
      {required BuildContext context,
      required String content,
      required int duration}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(seconds: duration),
      ),
    );
  }

  Widget textFieldOTP(
      {required BuildContext context,
      required bool first,
      required bool last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.purple),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget textformfield(
      {required TextEditingController controller,
      required String errorTitle,
      TextInputType? type,
      bool passwordMod = false,
      required String hintTitle,
        required String lableText,
      Widget? perfixicon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            lableText,
            style: TextStyle(fontSize: 12, color: MyColor().gray),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          textAlign: TextAlign.right,
          obscureText: passwordMod,
          style: TextStyle(color: MyColor().gray),
          keyboardType: type,
          validator: (value) {
            if (value == null || value.length < 5)
              return errorTitle;
            else
              return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: perfixicon,
            hintText: hintTitle,
            hintStyle: TextStyle(color: MyColor().gray_white, fontSize: 15),
            errorStyle: TextStyle(fontSize: 10),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColor().pink)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: MyColor().gray_white,
              ),
            ),
            // focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(
            //       color: Color(0xffc2c9d1),
            //     ),
            //     borderRadius: BorderRadius.circular(10)),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: BorderSide(
            //     color: Color(0xffc2c9d1),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }

  Widget elevatedForm(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required String buttonText,
      required double buttonWidth,
      double? buttonHeight,
      var page,
      bool? navigatBool,
      String? snackContent}) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext) => page(),
            ),
          );
        } else {
          FreeWidget()
              .snackbar(context: context, content: snackContent!, duration: 2);
        }
      },
      style: ElevatedButton.styleFrom(
          shadowColor: MyColor().gray, primary: MyColor().pink),
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth * 0.85,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 14, color: MyColor().gray),
          ),
        ),
      ),
    );
  }
}

// class sharedPreferences{
//   shared_SetData(bool data) async {
//     SharedPreferences prefc = await SharedPreferences.getInstance();
//     return prefc.setBool(remember_me, data);
//   }
//
//   shared_GetData() async {
//     SharedPreferences prefc = await SharedPreferences.getInstance();
//     shared_value = prefc.getBool(remember_me);
//     setState(() {});
//   }
//
//   shared_Navicator() async {
//     SharedPreferences prefc = await SharedPreferences.getInstance();
//     if (shared_value == true) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => StartPage()));
//     }
//   }
//
// }
