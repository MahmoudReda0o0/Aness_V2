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

class CreateNewAccount extends StatefulWidget {
  State<StatefulWidget> createState() {
    return CreateNewAccount_state();
  }
}

class CreateNewAccount_state extends State<CreateNewAccount> {
  bool reme_icon = false;
  final form_key = GlobalKey<FormState>();
  bool check_box = false;
  String remember_me = 'remember me';
  bool? shared_value;
  var controller_username = TextEditingController();
  var controller_password = TextEditingController();

  shared_SetData(bool data) async {
    SharedPreferences prefc = await SharedPreferences.getInstance();
    return prefc.setBool(remember_me, data);
  }

  shared_GetData() async {
    SharedPreferences prefc = await SharedPreferences.getInstance();
    shared_value = prefc.getBool(remember_me);
    setState(() {});
  }

  shared_Navicator() async {
    SharedPreferences prefc = await SharedPreferences.getInstance();
    if (shared_value == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StartPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    shared_GetData();
    shared_Navicator();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset('asset/image/bee.gif'),
            ),
            Text(
              'انشاء حساب جديد  ',
              style: TextStyle(fontSize: 50, color: Colors.redAccent[100]),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ButtonBar(
                  //   alignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     TextButton(
                  //       onPressed: (){},
                  //       child: Text('Sing in',
                  //         style: TextStyle(
                  //             fontSize: 30,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic
                  //         ),
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: (){},
                  //       child: Text('Sing up',
                  //         style: TextStyle(
                  //             fontSize: 30,
                  //             fontWeight: FontWeight.bold,
                  //             fontStyle: FontStyle.italic
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: form_key,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'البريد الالكتروني ',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: controller_username,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              hintText: 'Example@gmail.com',
                              //label: Align(alignment:Alignment.topRight,child: Text(' Example@gmail.com ',)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Valid Username';
                              }
                              return null;
                            },
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'الرقم السري',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: controller_password,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              hintText: '********',
                              //label: Align(alignment: Alignment.topRight,child: Text('********'),),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ' Valid Password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              autofocus: false,
              onPressed: () {
                if (form_key.currentState!.validate()) {
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
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.pinkAccent[100],
                ),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'انشاء حساب  ',
                      style: TextStyle(fontSize: 25, color: Colors.black54),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      print('open ForgetPassword Page');
                    },
                    child: Text(
                      'نسيت كلمه المرور ؟',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      print('remember me');
                    },
                    child: Text(
                      'تذكرني',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ],
            ),
            SizedBox(
                height: 20,
                width: 400,
                child: Divider(
                  color: Colors.black26,
                )),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook,size: 50,),
                  SizedBox(width: 20,),
                  Icon(Icons.g_mobiledata,size: 50,),
                ],
              ),
            ),
            Align(alignment: Alignment.center,child: Text('هل لديك حساب جديد؟ دخول',style: TextStyle(fontSize: 30,color: Colors.black),),),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
