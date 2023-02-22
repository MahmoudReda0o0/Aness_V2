import 'package:autism_app/UI/helper/constant.dart';
import 'package:flutter/material.dart';

import 'ForgetPasword.dart';

class ForgetPage1 extends StatefulWidget {


  const ForgetPage1({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPage1> createState() => _ForgetPage1State();
}

class _ForgetPage1State extends State<ForgetPage1> {
  TextEditingController _mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
              'نسيت كلمة السر ',
              style: TextStyle(
                fontSize: 20,
                color: MyColor().pink,
              ),
            ),
          ),
          SizedBox(
            width: MyPageSize.width(context) * 0.9,
            child: Text(
              'أدخل عنوان بريدك الإلكترونى لإعادة تعيين كلمة السر',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: MyColor().gray_white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'البريد الإلكتروني',
              style: TextStyle(color: MyColor().gray, fontSize: 14),
            ),
          ),
          TextField(
            controller:_mailController ,
            textAlign: TextAlign.right,
            style: TextStyle(color: MyColor().gray),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Example@gmail.com',
              hintStyle: TextStyle(color: MyColor().gray_white),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: MyColor().pink)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.black, primary: MyColor().pink),
            onPressed: () {
              print(_mailController.text);
              if (_mailController.text.length < 5) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text('أعد ادخال البريد الإلكتروني'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Open ForgetPage2'),
                    duration: Duration(seconds: 2),
                  ),
                );
                print('change tabpage');
                setState(() {
                  selectPage=1;
                  tabController?.animateTo(1);
                });
              }
            },
            child: Container(
              height: 45,
              width: MyPageSize.width(context) * 0.85,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'استمرار',
                  style: TextStyle(fontSize: 14, color: MyColor().gray),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

// class ForgetPage1 {
//   body({
//     required BuildContext context,
//     required TextEditingController controller,
//     required double width,
//     //required TabController tabController,
//   }) =>
//       Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 35,
//             // backgroundColor: Colors.black,
//             child: Image.asset('assets/image/passicon1.png'),
//           ),
//           Center(
//             child: Text(
//               'نسيت كلمة السر ',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: MyColor().pink,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: width * 0.9,
//             child: Text(
//               'أدخل عنوان بريدك الإلكترونى لإعادة تعيين كلمة السر',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: MyColor().gray_white,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: Text(
//               'البريد الإلكتروني',
//               style: TextStyle(color: MyColor().gray, fontSize: 14),
//             ),
//           ),
//           TextField(
//             controller: controller,
//             textAlign: TextAlign.right,
//             style: TextStyle(color: MyColor().gray),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               hintText: 'Example@gmail.com',
//               hintStyle: TextStyle(color: MyColor().gray_white),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(color: MyColor().pink)),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white10),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 shadowColor: Colors.black, primary: MyColor().pink),
//             onPressed: () {
//               print(controller.text);
//               if (controller.text.length < 5) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     duration: Duration(seconds: 2),
//                     content: Text('أعد ادخال البريد الإلكتروني'),
//                   ),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Open ForgetPage2'),
//                     duration: Duration(seconds: 2),
//                   ),
//                 );
//                 print('change tabpage');
//                 setState(() {
//                   tabController?.animateTo(1);
//                 });
//               }
//             },
//             child: Container(
//               height: 45,
//               width: width * 0.85,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   'استمرار',
//                   style: TextStyle(fontSize: 14, color: MyColor().gray),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 100,
//           )
//         ],
//       );
// }
