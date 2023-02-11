//import 'package:autism_app/UI/Screen/Sign_In_Screens/forget_password/1.RestoreWay.dart';
import 'package:autism_app/UI/Screen/profile/ProfileSetting.dart';
import 'package:flutter/material.dart';

class PresonalPage extends StatefulWidget {
  State<StatefulWidget> createState() => PersonalPage_s();
}

class PersonalPage_s extends State<PresonalPage> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _Width = MediaQuery.of(context).size.width;
    double _sliderValue = 30;
    TabController _tabcontroller =TabController(length: 3, vsync: this);
    bool _checkBox=true;
    return Column(
      children: [
        Container(
          height: _height * 0.1,
          width: _Width,
          //color: Colors.pink,
          child: Center(
            child: Text(
              'الصفحة الشخصية',
              style: TextStyle(fontSize: 30, color: Colors.black54),
            ),
          ),
        ),
        Container(
          height: _height * 0.8,
          width: _Width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Container(
                height: 75,
                width: _Width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.pinkAccent[100],
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSetting()));
                    }, icon: Icon(
                      Icons.pending_actions,
                      color: Colors.white,
                      size: 30,
                    ),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'أحمد محمد ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            ' Ahmed@gamil.com ',
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      AssetImage('assets/image/profile.jpg'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                width: _Width * 0.95,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3)),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المستوي 3',
                          style: TextStyle(
                              color: Colors.black45, fontSize: 15),
                        ),
                        Text(
                          ' ${_sliderValue}التقدم',
                          style: TextStyle(
                              fontSize: 20, color: Colors.black87),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          trackHeight: 30,
                          thumbColor: Colors.pinkAccent,
                          activeTrackColor: Colors.pinkAccent[200],
                          inactiveTrackColor: Colors.pinkAccent[100],
                          //trackShape: RectangularSliderTrackShape(),
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 16,
                              disabledThumbRadius: 0)),
                      child: Container(
                        width: 400,
                        child: Slider(
                          min: 0,
                          max: 100,
                          value: _sliderValue,
                          onChanged: (double value) {
                            setState(() => _sliderValue = value);
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        container_all(choose: true,size:30,leading: '3يوم',title: 'مدة التدريب',icon: Icons.account_balance,color:Colors.white70),
                        container_all(choose: true,size:25,leading: '300',title: 'عدد التحديات' ,icon: Icons.alt_route_rounded,color: Colors.white70),
                      ],)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                width: _Width * 0.95,
                height: 112,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3)),
                    ]),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'الاحصائيات',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        container_all(choose: true,size: 40,leading: '500',title: 'الكلمات',icon: Icons.wallet,color:Colors.pink[100]),
                        container_all(choose: true,size:40,leading: '%70',title: 'الدقه' ,icon: Icons.add_circle,color: Colors.pink[100]),
                      ],)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3)),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: _Width*0.95,
                height: 180,
                child: Column(

                  children: [
                    Align(alignment: Alignment.topRight,
                      child: Text('الاعدادات',style: TextStyle(color: Colors.black54,fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),),
                    container_setting(leading_check: true,title: 'الصوت',icon: Icons.keyboard_voice_outlined),
                    container_setting(leading_check: true,title: 'الاشعارات',icon: Icons.phonelink_ring),
                    container_setting(leading_check: false,title: "الخصوصية",icon_check:Icons.arrow_back_ios,color: Colors.black,icon: Icons.shield_moon_outlined ),
                    container_setting(leading_check: false,title: 'الخروج',icon_check: Icons.hourglass_empty,color: Colors.white,icon: Icons.exit_to_app)
                  ],
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
  // Widget text_all(){
  //   return Text()
  // }
  Widget container_setting({required bool leading_check ,IconData? icon_check,required String title,required IconData icon, Color? color}){
    return Container(
      width: 700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          leading_check? Checkbox(value: true, onChanged: (bool? value){}): Icon(icon_check,color: color,),
          SizedBox(width: 200),
          Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),),
          Icon(icon ,color: Colors.pinkAccent,)
        ],
      ),
    );
  }
  Widget container_all ({ required double size,required bool choose ,Widget? child, String? leading,required String title, required IconData icon,required Color? color}){
    return Container(
      width: 200,
      height: 50,
      //margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3)),
          ],
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          choose? Text(leading!): SizedBox(height: 50,width: 50,child: child,),
          SizedBox(width: size),
          Text(title,style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
          SizedBox(width: 10),
          Icon(icon)
        ],),
    );
  }
}
