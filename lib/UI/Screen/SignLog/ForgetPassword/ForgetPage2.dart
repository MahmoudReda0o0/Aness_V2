import 'dart:math';

import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

import 'ForgetPasword.dart';


class ForgetPage2 extends StatefulWidget {
  const ForgetPage2({Key? key}) : super(key: key);

  @override
  State<ForgetPage2> createState() => _ForgetPage2State();
}

class _ForgetPage2State extends State<ForgetPage2> {
  Random num1 = Random();
  Random num2 = Random();
  Random num3 = Random();
  Random num4 = Random();

  List<TextEditingController> numcon = List.generate(4, (index) {
    return TextEditingController();
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          // backgroundColor: Colors.black,
          child: Image.asset('assets/image/passicon1.png'),
        ),
        Center(
          child: Text(
            'أدخل رمز التحقق  ',
            style: TextStyle(
              fontSize: 20,
              color: MyColor().pink,
            ),
          ),
        ),
        SizedBox(
          width: MyPageSize.width(context) * 0.9,
          child: Text(
            'أدخل رمز التحقق  الذي أرسلناه الان على بريدك الإلكتروني المسجل',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: MyColor().gray_white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // children: List.generate(4, (index) {
          //   return _textFieldOTP(controller: numcon[index],first: true, last: false, context: context);
          // }),

          children: [
            _textFieldOTP(
                controller: numcon[0],
                first: true,
                last: false,
                context: context),
            _textFieldOTP(
                controller: numcon[1],
                first: false,
                last: false,
                context: context),
            _textFieldOTP(
                controller: numcon[2],
                first: false,
                last: false,
                context: context),
            _textFieldOTP(
                controller: numcon[3],
                first: false,
                last: true,
                context: context),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            print(num1);
            print(numcon[0].text);
            print(numcon[2].text);
            setState((){
              selectPage=2;
              tabController?.animateTo(2);

            });
          },
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.black, primary: MyColor().pink),
          // onPressed: () {
          //   print(controller.text);
          //   if (controller.text.length < 5) {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         duration: Duration(seconds: 2),
          //         content: Text('أعد ادخال البريد الإلكتروني'),
          //       ),
          //     );
          //   }
          //   else {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Open ForgetPage2'),duration: Duration(seconds: 2),),);
          //     print('change tabpage');
          //
          //   }
          // },
          child: Container(
            height: 45,
            width: MyPageSize.width(context) * 0.85,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'تحقق',
                style: TextStyle(fontSize: 14, color: MyColor().gray),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'New OTP Code is  ${num1.nextInt(9)} ${num2.nextInt(9)} ${num3.nextInt(9)} ${num4.nextInt(9)}'),
                duration: Duration(seconds: 3),
              ),
            );
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(fontFamily: "Alexandria", fontSize: 14),
                children: [
                  TextSpan(
                    text: 'لم تحصل علي رمز التحقق؟ ',
                    style: TextStyle(color: MyColor().gray),
                  ),
                  TextSpan(
                    text: 'إعاده الإرسال ',
                    style: TextStyle(color: MyColor().pink),
                  )
                ]),
          ),
        ),
        SizedBox(
          height: 90,
        )
      ],
    );
  }
  Widget _textFieldOTP(
      {required bool first,
        required bool last,
        required BuildContext context,
        required TextEditingController controller}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          controller: controller,
          autofocus: false,
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
            filled: true,
            fillColor: Colors.white,
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: MyColor().pink),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}


// class ForgetPage2 {
//   Random num1 = Random();
//   Random num2 = Random();
//   Random num3 = Random();
//   Random num4 = Random();
//
//   List<TextEditingController> numcon = List.generate(4, (index) {
//     return TextEditingController();
//   });
//
//   body({required BuildContext context, required double width}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           radius: 35,
//           // backgroundColor: Colors.black,
//           child: Image.asset('assets/image/passicon1.png'),
//         ),
//         Center(
//           child: Text(
//             'أدخل رمز التحقق  ',
//             style: TextStyle(
//               fontSize: 20,
//               color: MyColor().pink,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: width * 0.9,
//           child: Text(
//             'أدخل رمز التحقق  الذي أرسلناه الان على بريدك الإلكتروني المسجل',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               color: MyColor().gray_white,
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           // children: List.generate(4, (index) {
//           //   return _textFieldOTP(controller: numcon[index],first: true, last: false, context: context);
//           // }),
//
//           children: [
//             _textFieldOTP(
//                 controller: numcon[0],
//                 first: true,
//                 last: false,
//                 context: context),
//             _textFieldOTP(
//                 controller: numcon[1],
//                 first: false,
//                 last: false,
//                 context: context),
//             _textFieldOTP(
//                 controller: numcon[2],
//                 first: false,
//                 last: false,
//                 context: context),
//             _textFieldOTP(
//                 controller: numcon[3],
//                 first: false,
//                 last: true,
//                 context: context),
//           ],
//         ),
//         ElevatedButton(
//           onPressed: () {
//             print(num1);
//             print(numcon[0].text);
//             print(numcon[2].text);
//           },
//           style: ElevatedButton.styleFrom(
//               shadowColor: Colors.black, primary: MyColor().pink),
//           // onPressed: () {
//           //   print(controller.text);
//           //   if (controller.text.length < 5) {
//           //     ScaffoldMessenger.of(context).showSnackBar(
//           //       SnackBar(
//           //         duration: Duration(seconds: 2),
//           //         content: Text('أعد ادخال البريد الإلكتروني'),
//           //       ),
//           //     );
//           //   }
//           //   else {
//           //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Open ForgetPage2'),duration: Duration(seconds: 2),),);
//           //     print('change tabpage');
//           //
//           //   }
//           // },
//           child: Container(
//             height: 45,
//             width: width * 0.85,
//             child: Align(
//               alignment: Alignment.center,
//               child: Text(
//                 'تحقق',
//                 style: TextStyle(fontSize: 14, color: MyColor().gray),
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                     'New OTP Code is  ${num1.nextInt(9)} ${num2.nextInt(9)} ${num3.nextInt(9)} ${num4.nextInt(9)}'),
//                 duration: Duration(seconds: 3),
//               ),
//             );
//           },
//           child: RichText(
//             textAlign: TextAlign.center,
//             text: TextSpan(
//                 style: TextStyle(fontFamily: "Alexandria", fontSize: 14),
//                 children: [
//                   TextSpan(
//                     text: 'لم تحصل علي رمز التحقق؟ ',
//                     style: TextStyle(color: MyColor().gray),
//                   ),
//                   TextSpan(
//                     text: 'إعاده الإرسال ',
//                     style: TextStyle(color: MyColor().pink),
//                   )
//                 ]),
//           ),
//         ),
//         SizedBox(
//           height: 90,
//         )
//       ],
//     );
//   }
//
//
// }
