import 'package:flutter/material.dart';

class ProfileSetting extends StatefulWidget {
  State<StatefulWidget> createState() => ProfileSetting_s();
}

class ProfileSetting_s extends State<ProfileSetting> {
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //padding:EdgeInsets.all(10),
            height: _height,
            width: double.infinity,
            child: FittedBox(
                fit: BoxFit.fill,
                child: Image(image: AssetImage('assets/image/screen.png'))),
          ),
          Column(
            children: [
              Container(
                height: _height * 0.2,
                width: double.infinity,
              ),
              Container(
                height: _height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 30),
              ListTile(
                title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'تعديل البيانات الشخصية',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.blueGrey[800]),
                    )),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: 100,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/image/profile.jpg'),
                ),
              ),
              Center(
                child: Text(
                  ' أحمد محمد ',
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey[800]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'أسم الطفل',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null)
                            return 'من فضلك ادخل الاسم';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                            // hintTextDirection:InputDecoration,
                            hintText: 'أدخل اسم الطفل',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'البريد الالكتروني',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null)
                            return 'اعد ادخال البريد الالكتروني';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                            // hintTextDirection:InputDecoration,
                            hintText: 'ادخل البريد الالكتروني',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'الرقم السري',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null)
                            return 'تاكد من الرقم السري';
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                            // hintTextDirection:InputDecoration,
                            hintText: 'ادخل الرقم السري',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent[200]
                    ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('not true');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('ادخل البيانات الصحيحه للطفل 🤓💀'),
                            ),
                          );
                        } else
                          print('true');
                      },
                      child: Container(
                        height: 45,
                          width: 150,
                          //color: Colors.pinkAccent[200],
                          child: Text('تحديث البيانات',style: TextStyle(fontSize: 23, color: Colors.blue[900]),
                            textAlign: TextAlign.center,))),
                  SizedBox(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      height: 45,
                      width: 150,
                      child: Text(
                        'ألغاء',
                        style: TextStyle(fontSize: 23, color: Colors.blue[900]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            top: 150,
              right: 180,
              child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Icon(Icons.edit,size: 30,color: Colors.blueGrey[800],),),),
        ],
      ),
    );
  }
}
