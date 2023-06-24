// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:autism_app/ApiData/Models/ModelLoginToken.dart';
import 'package:autism_app/Features/Presentation_Screens/AccountRegister/UI/View/RegisterEmailPass.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import '../../../../../main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../Core/constant.dart';
import '../../../../Widgets/FreeWidget.dart';
import '../../../App_Start_Page/UI/View/StartPage.dart';
import '../../../ForgetPassword/UI/View/ForgetPasword.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _rememberIcon = false;
  bool _passEye = false;
  final _formKey = GlobalKey<FormState>();
  final _emailConntroller = TextEditingController();
  final _passwordController = TextEditingController();

  bool checkBox = false;

  String RememberMy = "RememberMyLogin";
  String RemEmail = "RememberEmail";
  String RemPassWord = 'RememberPassWord';
  bool? CheckBoxValue;
  String? Email;
  String? Pass;

  Shared_SetData(
      {required bool rememberMe,
      required String remEmail,
      required String remPass}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(RememberMy, rememberMe);
    pref.setString(RemEmail, remEmail);
    pref.setString(RemPassWord, remPass);
  }

  Shared_GetData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    CheckBoxValue = pref.getBool(RememberMy);
    Email = pref.getString(RemEmail);
    Pass = pref.getString(RemPassWord);
    setState(() {});
  }

  Shared_Navigate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(Provider.of<ProviderLoginToken>(context,listen: false).state==LoginTokenState.pop){
      setState(() {
        Provider.of<ProviderLoginToken>(context,listen: false).state = LoginTokenState.initial;
      });
      print('state : pop');
    }
    else{
      if (CheckBoxValue == true ) {
        print('shared if under check boxValue');
        await Provider.of<ProviderLoginToken>(context, listen: false).Login(
          email: Email!,
          password: Pass!,
        );
        if (Provider.of<ProviderLoginToken>(context, listen: false).state == LoginTokenState.loaded) {
          setState(() {
            GlobalAccessToken =
            Provider.of<ProviderLoginToken>(context, listen: false)
                .loginModel
                .access!;
          });
          print('AccessToken : $GlobalAccessToken');
         // await Provider.of<ProviderChildProfile>(context,listen: false).GetChildProfileData();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StartPage(),
            ),
          );
        } else {
          print(
              'Login Page State : ${Provider.of<ProviderLoginToken>(context, listen: false).state}');
        }
      } else {
        print(' Enter Data to Login ');
      }
    }
  }

  @override
  void initState() {
    print('initState print : ${Provider.of<ProviderLoginToken>(context,listen: false).state}');
    super.initState();
    // setState(() {
    //   Provider.of<ProviderLoginToken>(context,listen: false).state = LoginTokenState.initial;
    // });
    Shared_GetData();
    Shared_Navigate();
  }



  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    final providerLogin = Provider.of<ProviderLoginToken>(context);
    return Consumer2<ProviderLoginToken,ProviderChildProfile>(builder: (context,_,ch,child){
      if (providerLogin.state == LoginTokenState.initial ||
          providerLogin.state == LoginTokenState.error) {
        print('init and error print : ${Provider.of<ProviderLoginToken>(context,listen: false).state}');
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
                      height: 10,
                    ),
                    (keyboard==0)? Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/image/signicon.png'),
                    ):SizedBox(),
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
                                lableText: 'البريد الإلكتروني'),
                            const SizedBox(
                              height: 15,
                            ),
                            FreeWidget().textformfield(
                              lableText: 'الرقم السري',
                              controller: _passwordController,
                              errorTitle: 'أعد ادخال الرقم السرى',
                              hintTitle: '******* ',
                              passwordMod: !_passEye,
                              type: TextInputType.text,
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
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          print('Enter if form key');
                          // await _.AccountRegisterProvider();
                          await _.Login(
                            email: _emailConntroller.text,
                            password: _passwordController.text,
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
                            style:
                            TextStyle(fontSize: 14, color: MyColor().gray),
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
                              print('open Forget Password Page');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassWord()));
                            },
                            child: Text(
                              'نسيت كلمة المرور ؟',
                              style: TextStyle(
                                  fontSize: 14, color: MyColor().gray),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {

                              if(_emailConntroller.text.length==0||_passwordController.text.length==0){
                                print('plz Enter your email and pass noob');
                                setState(() {
                                  checkBox=false;
                                });
                              }else{
                                setState(() {
                                  _rememberIcon = !_rememberIcon;
                                  checkBox = _rememberIcon;
                                });
                                Shared_SetData(
                                  rememberMe: checkBox,
                                  remEmail: _emailConntroller.text,
                                  remPass: _passwordController.text,
                                );
                              }
                              print('remember me');
                              print('check box $checkBox');
                              print('check email ${_emailConntroller.text}');
                              print('check pass ${_emailConntroller.text}');

                            },
                            label: Text(
                              'تذكرني',
                              style: TextStyle(
                                  fontSize: 14, color: MyColor().gray),
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
                    GestureDetector(
                      onTap: () {
                        print('Open Log In Screen');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterEmailPass()));
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
                              style: TextStyle(
                                  color: MyColor().pink, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                        child: _.showErrorMessage
                            ? Text(
                          'من فضلك أعد إدخال البيانات صحيحة',
                          style:
                          TextStyle(color: Colors.red, fontSize: 18),
                        )
                            : SizedBox()),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }     // State initial or error
      else if( providerLogin.state == LoginTokenState.loaded){
        print('loaded print : ${Provider.of<ProviderLoginToken>(context,listen: false).state}');
        return StartPage();
      } // State Loaded
      else {
        return Container(
          height: MyPageSize.height(context),
          width:  MyPageSize.width(context),
          child: Center(
            child:Image.asset('assets/image/anessloading.gif'),
          ),
        );
      }                                                   // State Loading
    });



















    // if (providerLogin.state == LoginTokenState.initial ||
    //     providerLogin.state == LoginTokenState.error) {
    //   print('init and error print : ${Provider.of<ProviderLoginToken>(context,listen: false).state}');
    //   return GestureDetector(
    //     onTap: () {
    //       FocusManager.instance.primaryFocus?.unfocus();
    //       FocusScope.of(context).unfocus();
    //     },
    //     child: Consumer<ProviderLoginToken>(
    //         builder: (BuildContext context, _, child) {
    //       return Scaffold(
    //         // backgroundColor: Colors.white30,
    //         resizeToAvoidBottomInset: false,
    //         body: Stack(
    //           children: [
    //             Container(
    //               child: const Image(
    //                 fit: BoxFit.fill,
    //                 image: AssetImage('assets/image/backscreen.png'),
    //               ),
    //             ),
    //             Container(
    //               height: _height,
    //               width: _width,
    //               color: Colors.black.withOpacity(0.0),
    //             ),
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 const SizedBox(
    //                   height: 15,
    //                 ),
    //                 Container(
    //                   height: 100,
    //                   width: 100,
    //                   child: Image.asset('assets/image/signicon.png'),
    //                 ),
    //                 Text(
    //                   'تسجيل الدخول ',
    //                   style: TextStyle(
    //                       fontFamily: 'Alexandria',
    //                       fontSize: 16,
    //                       color: MyColor().pink),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Form(
    //                     key: _formKey,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         FreeWidget().textformfield(
    //                             controller: _emailConntroller,
    //                             errorTitle: 'أعد ادخال البريد الإلكتروني ',
    //                             hintTitle: 'Example@gmail.com',
    //                             lableText: 'البريد الإلكتروني'),
    //                         const SizedBox(
    //                           height: 15,
    //                         ),
    //                         FreeWidget().textformfield(
    //                           lableText: 'الرقم السري',
    //                           controller: _passwordController,
    //                           errorTitle: 'أعد ادخال الرقم السرى',
    //                           hintTitle: '******* ',
    //                           passwordMod: !_passEye,
    //                           type: TextInputType.text,
    //                           perfixicon: IconButton(
    //                             onPressed: () {
    //                               setState(() => _passEye = !_passEye);
    //                             },
    //                             icon: _passEye
    //                                 ? const Icon(
    //                                     Icons.remove_red_eye,
    //                                     color: Colors.blue,
    //                                   )
    //                                 : Icon(Icons.remove_red_eye_outlined),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 ElevatedButton(
    //                   onPressed: () async {
    //                     FocusManager.instance.primaryFocus?.unfocus();
    //                     FocusScope.of(context).unfocus();
    //                     if (_formKey.currentState!.validate()) {
    //                       print('Enter if form key');
    //                       // await _.AccountRegisterProvider();
    //                       await _.Login(
    //                         email: _emailConntroller.text,
    //                         password: _passwordController.text,
    //                       );
    //                     } else {
    //                       FreeWidget().snackbar(
    //                           context: context,
    //                           content: 'اعد ادخال البيانات صحيحة',
    //                           duration: 2);
    //                     }
    //                   },
    //                   style: ElevatedButton.styleFrom(
    //                       shadowColor: MyColor().gray, primary: MyColor().pink),
    //                   child: SizedBox(
    //                     height: 50,
    //                     width: _width * 0.85,
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: Text(
    //                         'تسجيل الدخول ',
    //                         style:
    //                             TextStyle(fontSize: 14, color: MyColor().gray),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       TextButton(
    //                         onPressed: () {
    //                           print('open Forget Password Page');
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) => ForgetPassWord()));
    //                         },
    //                         child: Text(
    //                           'نسيت كلمة المرور ؟',
    //                           style: TextStyle(
    //                               fontSize: 14, color: MyColor().gray),
    //                         ),
    //                       ),
    //                       TextButton.icon(
    //                         onPressed: () {
    //                           setState(() => _rememberIcon = !_rememberIcon);
    //                           setState(() {
    //                             checkBox = _rememberIcon;
    //                           });
    //                           print('remember me');
    //                           print('$checkBox');
    //                           Shared_SetData(
    //                             rememberMe: checkBox,
    //                             remEmail: _emailConntroller.text,
    //                             remPass: _passwordController.text,
    //                           );
    //                         },
    //                         label: Text(
    //                           'تذكرني',
    //                           style: TextStyle(
    //                               fontSize: 14, color: MyColor().gray),
    //                         ),
    //                         icon: _rememberIcon
    //                             ? Icon(
    //                                 Icons.check_box,
    //                                 color: MyColor().pink,
    //                               )
    //                             : Icon(
    //                                 Icons.check_box_outline_blank_sharp,
    //                                 color: MyColor().gray_white,
    //                               ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 20,
    //                   width: 350,
    //                   child: Divider(
    //                     color: Colors.black26,
    //                   ),
    //                 ),
    //                 Center(
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       // GestureDetector(
    //                       //   onTap: () => FreeWidget().snackbar(
    //                       //       context: context,
    //                       //       content: 'Sign in with Face Account',
    //                       //       duration: 2),
    //                       //   child: CircleAvatar(
    //                       //     child: Image(
    //                       //       image: AssetImage('assets/image/faceicon.png'),
    //                       //     ),
    //                       //   ),
    //                       // ),
    //                       SizedBox(
    //                         width: 30,
    //                       ),
    //                       // GestureDetector(
    //                       //   onTap: () => FreeWidget().snackbar(
    //                       //       context: context,
    //                       //       content: 'Sign in with Gmail Account',
    //                       //       duration: 2),
    //                       //   child: CircleAvatar(
    //                       //     backgroundColor: Colors.white,
    //                       //     radius: 25,
    //                       //     child: Image(
    //                       //       image: AssetImage('assets/image/gmail.png'),
    //                       //     ),
    //                       //   ),
    //                       // )
    //                     ],
    //                   ),
    //                 ),
    //                 GestureDetector(
    //                   onTap: () {
    //                     print('Open Log In Screen');
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => RegisterEmailPass()));
    //                   },
    //                   child: RichText(
    //                     text: TextSpan(
    //                       text: 'لا تملك حساب ؟ ',
    //                       style: TextStyle(
    //                           color: MyColor().gray,
    //                           fontSize: 14,
    //                           fontFamily: 'Alexandria'),
    //                       children: [
    //                         TextSpan(
    //                           children: [],
    //                           text: 'سجل الان',
    //                           style: TextStyle(
    //                               color: MyColor().pink, fontSize: 16),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   height: 8,
    //                 ),
    //                 Center(
    //                     child: _.showErrorMessage
    //                         ? Text(
    //                             'من فضلك أعد إدخال البيانات صحيحة',
    //                             style:
    //                                 TextStyle(color: Colors.red, fontSize: 18),
    //                           )
    //                         : SizedBox()),
    //                 const SizedBox(
    //                   height: 5,
    //                 )
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     }),
    //   );
    // }
    // else if( providerLogin.state == LoginTokenState.loaded){
    //   print('loaded print : ${Provider.of<ProviderLoginToken>(context,listen: false).state}');
    //   return StartPage();
    // }
    // // else if (providerLogin.state == LoginTokenState.error) {
    // //   return Scaffold(
    // //     body: Center(
    // //       child: Text('${providerLogin.ErrorMessage}'),
    // //     ),
    // //   );
    // // }
    // // else if (providerLogin.state == LoginTokenState.loaded) {
    // //   return Scaffold(
    // //     body: Consumer<ProviderLoginToken>(builder: (context, _, child) {
    // //       return Column(
    // //         mainAxisAlignment: MainAxisAlignment.center,
    // //         children: [
    // //           Center(
    // //             child: Text('Loaded data'),
    // //           ),
    // //           Container(
    // //             child: Text('${_.loginModel.access}'),
    // //           ),
    // //           Center(
    // //             child: ElevatedButton(
    // //               onPressed: () {
    // //                 setState(() {
    // //                   GlobalAccessToken = _.loginModel.access!;
    // //                 });
    // //                 print('Global Access Token : $GlobalAccessToken');
    // //                 _.getAccessToken(acessToken: _.loginModel.access);
    // //                 print('access from provider ${_.accessToken}');
    // //                 Navigator.push(context,
    // //                     MaterialPageRoute(builder: (context) => StartPage()));
    // //               },
    // //               child: Icon(Icons.done),
    // //             ),
    // //           )
    // //         ],
    // //       );
    // //     }),
    // //   );
    // // }
    // //
    // else {
    //   return Container(
    //     height: MyPageSize.height(context),
    //     width:  MyPageSize.width(context),
    //     child: Center(
    //       child:Image.asset('assets/image/anessloading.gif'),
    //
    //     ),
    //   );
    // }
  }
}
