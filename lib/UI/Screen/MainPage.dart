import 'package:autism_app/UI/Screen/profile/Personal%20Page.dart';
import 'package:flutter/material.dart';



class MainPage extends StatefulWidget{
  State<StatefulWidget> createState()=>MainPage_s();
}

class MainPage_s extends State<MainPage>with TickerProviderStateMixin{
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _Width = MediaQuery.of(context).size.width;
    TabController _tabcontroller =TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(

      ),
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
            children: [
              Container(
                height: _height * 0.1,
                width: _Width,
                //color: Colors.pink,
              ),
              Container(
                height: _height * 0.9,
                width: _Width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height:50,
                      width: _Width*0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pinkAccent,
                      ),
                      child: TabBar(
                          controller: _tabcontroller,
                          tabs: [
                            Icon(Icons.home,size: 40,),
                            Icon(Icons.person,size: 40),
                            Icon(Icons.book,size: 40)
                          ]),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height:_height*0.95,
            width: _Width,
            // color: Colors.blue,
            child: TabBarView(
              controller: _tabcontroller,
              children: [
                Text('instruction'),
                PresonalPage(),
                Text('instruction')
              ],
            ),
          ),
        ],
      ),
    );
  }
}