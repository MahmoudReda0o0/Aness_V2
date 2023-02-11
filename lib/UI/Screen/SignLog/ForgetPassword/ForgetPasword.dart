import 'package:flutter/material.dart';

class ForgetPassWord extends StatefulWidget {
  State<StatefulWidget> createState() => ForgetPassWord_s();
}

class ForgetPassWord_s extends State<ForgetPassWord>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    final FormKey = GlobalKey<FormState>();
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    TextEditingController _mailController = TextEditingController();
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image(image: AssetImage('assets/image/screen.png'))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_rounded))),
                // SizedBox(
                //   height: 10,
                // ),
                Center(
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TabBar(
                      mouseCursor: MouseCursor.uncontrolled,
                      controller: _tabController,
                      labelColor: Colors.pinkAccent,
                      unselectedLabelColor: Colors.pinkAccent[100],
                      splashBorderRadius: BorderRadius.circular(20),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.one_k),
                        ),
                        Tab(
                          icon: Icon(Icons.two_k),
                        ),
                        Tab(
                          icon: Icon(Icons.three_k),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.75,
                    //color: Colors.redAccent,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset('assets/image/h2.gif')),
                            Center(
                                child: Text('نسيت كلمة السر ',
                                    style: TextStyle(
                                        fontSize: 45,
                                        color: Colors.redAccent[100]))),
                            SizedBox(
                              width: 400,
                              child: Text(
                                  'أدخل عنوان بريدك الإلكترونى لإعادة تعيين كلمة السر',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black38,
                                  )),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'البريد الالكتروني',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            TextField(
                              controller: _mailController,
                              decoration: InputDecoration(
                                  hintText: 'Example@gmail.com',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pinkAccent[100]),
                              onPressed: () {},
                              child: Container(
                                height: 45,
                                width: Width * 0.85,
                                child: Text(
                                  'استمرار',
                                  style: TextStyle(
                                      fontSize: 23, color: Colors.blue[900]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset('assets/image/h2.gif')),
                            Center(
                                child: Text('أدخل رمز التحقق  ',
                                    style: TextStyle(
                                        fontSize: 45,
                                        color: Colors.redAccent[100]))),
                            SizedBox(
                              width: 400,
                              child: Text(
                                'أدخل رمز التحقق الذي ارسلناه علي بريدك الالكتروني المسجل',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                VER_Code(),
                                VER_Code(),
                                VER_Code(),
                                VER_Code(),
                                VER_Code(),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pinkAccent[100]),
                              onPressed: () {},
                              child: Container(
                                height: 45,
                                width: Width * 0.85,
                                child: Text(
                                  'تحقق',
                                  style: TextStyle(
                                      fontSize: 23, color: Colors.blue[900]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Text(
                              'لم تحصل علي رمز التحقق ؟ اعاده الارسال ',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 90,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset('assets/image/h2.gif')),
                            Center(
                                child: Text('اعادة تعيين كلمة السر  ',
                                    style: TextStyle(
                                        fontSize: 45,
                                        color: Colors.redAccent[100]))),
                            SizedBox(
                              width: 400,
                              child: Text(
                                'قم بانشاء كلمة المرور الجديدة لتسجيل الدخول',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Form(
                              key: FormKey,
                              child: Column(
                                children: [
                                  Align(alignment: Alignment.topRight,child: Text('الرقم السري الجديد',style: TextStyle(color: Colors.black,fontSize: 20),)),
                                  SizedBox(height: 8,),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '* * * * * *',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        )
                                    ),
                                    validator: (value){
                                      if(value==null|| value.length<6)
                                        return 'valid Password';
                                      else return null;
                                    },
                                  ),
                                  SizedBox(height: 15,),
                                  Align(alignment: Alignment.topRight,child: Text('تاكيد الرقم السري',style: TextStyle(color: Colors.black,fontSize: 20),)),
                                  SizedBox(height: 8,),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '* * * * * *',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        )
                                    ),
                                    validator: (value){
                                      if(value==null|| value.length<6)
                                        return 'valid Password';
                                      else return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pinkAccent[100]),
                              onPressed: () {},
                              child: Container(
                                height: 45,
                                width: Width * 0.85,
                                child: Text(
                                  'تاكيد',
                                  style: TextStyle(
                                      fontSize: 23, color: Colors.blue[900]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget VER_Code() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
