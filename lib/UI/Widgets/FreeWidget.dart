import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreeWidget {
  Widget textformfield({required TextEditingController controller,required String errorTitle,TextInputType? type,bool passwordMod =false,required String hintTitle,Widget? child}) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      obscureText: passwordMod,
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
        prefixIcon: child,
        hintText: hintTitle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xffc2c9d1),
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
