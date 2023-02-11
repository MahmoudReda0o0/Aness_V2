import 'package:flutter/material.dart';

class StartPage extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Start',style: TextStyle(fontSize: 50),),
      ),
    );
  }
}