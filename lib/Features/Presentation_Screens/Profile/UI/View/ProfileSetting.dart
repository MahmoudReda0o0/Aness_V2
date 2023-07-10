import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/FreeWidget.dart';
import '../../../App_Start_Page/UI/View/StartPage.dart';
import '../Widget/ShowBottomSheet.dart';

class ProfileSetting extends StatefulWidget {
  State<StatefulWidget> createState() => ProfileSetting_s();
}

class ProfileSetting_s extends State<ProfileSetting> {
  TextEditingController _fristnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool _passEye = false;
  bool _selectImageColor = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    var childData = Provider.of<ProviderChildProfile>(context, listen: false)
        .childProfileResult;
    _fristnameController.text = childData!.childProfileModel!.userInfo!.firstName!;
    _lastnameController.text = childData!.childProfileModel!.userInfo!.lastName!;
    _emailController.text = childData!.childProfileModel!.userInfo!.email!;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Consumer<ProviderChildProfile>(builder: (context, _, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    child: Image(
                      height: MyPageSize.height(context) * 0.25,
                      width: MyPageSize.width(context),
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/backscreen1.png'),
                    ),
                  ),
                  Container(
                    height: MyPageSize.height(context) * 0.75,
                    width: MyPageSize.width(context),
                    child: Image(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/image/backscreen.png'),
                    ),
                  )
                ],
              ),

              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MyPageSize.height(context) * 0.03),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'تعديل البيانات الشخصية',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: MyColor().gray),
                      )),
                  SizedBox(
                    height: MyPageSize.height(context) * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ShowBottomSheet();
                          });
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/image/profileimage.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '${_.childProfileResult!.childProfileModel!.userInfo!.username}',
                      style: TextStyle(fontSize: 15, color: MyColor().gray),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FreeWidget().textformfield(
                            controller: _fristnameController,
                            errorTitle: '',
                            hintTitle: "",
                            lableText: 'إسم الطفل',
                          ),
                          SizedBox(height: 15),
                          FreeWidget().textformfield(
                            controller: _lastnameController,
                            errorTitle: '',
                            hintTitle: "",
                            lableText: 'إسم العائلة',
                          ),
                          SizedBox(height: 15),
                          FreeWidget().textformfield(
                              controller: _emailController,
                              errorTitle: '',
                              hintTitle: 'Example@gmail.com',
                              lableText: "البريد الإلكتروني"),
                          SizedBox(height: 15),
                          FreeWidget().textformfield(
                              passwordMod: !_passEye,
                              perfixicon: IconButton(
                                  onPressed: () {
                                    setState(() => _passEye = !_passEye);
                                  },
                                  icon: _passEye
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.blue,
                                        )
                                      : Icon(Icons.remove_red_eye_outlined)),
                              controller: _passController,
                              errorTitle: '',
                              hintTitle: '********',
                              lableText: "الرقم السري")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: MyColor().pink),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StartPage()));
                          } else
                            FreeWidget().snackbar(
                                context: context,
                                content: "ادخل البيانات الصحيحه للطفل",
                                duration: 1);
                        },
                        child: Container(
                          height: 45,
                          width: 130,
                          //color: Colors.pinkAccent[200],
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'تحديث البيانات',
                              style: TextStyle(
                                  fontSize: 14, color: MyColor().gray),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white.withOpacity(0.9),
                          shadowColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 45,
                          width: 130,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'ألغاء',
                              style: TextStyle(
                                  fontSize: 14, color: MyColor().gray),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              // Positioned(
              //   top: 150,
              //   right: 180,
              //   child: CircleAvatar(
              //     backgroundColor: Colors.white70,
              //     child: Icon(
              //       Icons.edit,
              //       size: 30,
              //       color: Colors.blueGrey[800],
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
  // Widget ShowBottomSheet(){
  //   List<Color>colorList=List.generate(20, (index) {
  //     return Colors.white;
  //   });
  //   return SizedBox(
  //       height: MyPageSize.height(context)*0.9,
  //       width: MyPageSize.width(context),
  //       child: GridView.count(
  //         crossAxisSpacing: 10,
  //         mainAxisSpacing: 10,
  //         scrollDirection: Axis.vertical,
  //         childAspectRatio: (10/10),
  //         crossAxisCount: 3,
  //         children: List.generate(20, (index) {
  //           return GestureDetector(
  //             onTap: ()async{
  //               setState(() {
  //                 colorList[index]=Colors.red;
  //               });
  //               await Future.delayed(Duration(seconds: 1)).then((value) => Navigator.pop(context));
  //               print('awiat done');
  //               print('${_selectImageColor}');
  //               setState(() {
  //                 _selectImageColor=false;
  //               });
  //             },
  //             child: Container(
  //               height: 100,
  //               width: 100,
  //               color: colorList[index],
  //
  //               child: Image(
  //                 image: AssetImage('assets/image/selectimage.png'),
  //               ),
  //             ),
  //           );
  //         }),
  //       )
  //   );
  // }
}
