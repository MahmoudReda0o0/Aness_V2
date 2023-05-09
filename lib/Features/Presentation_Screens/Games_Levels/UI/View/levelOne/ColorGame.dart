import 'dart:math';

import 'package:flutter/material.dart';

class ColorGame extends StatefulWidget{
  State<StatefulWidget>createState()=>ColorGame_s();
}

List<String> color_list=['احمر','اخضر','ازرق','اصفر'];
Random color_rondom = new Random();
String?  color_select;
String? color_user;
MaterialColor block_color=Colors.grey;
bool block_bool=false;
// color[rondom_color.nextInt(color.length)];

class ColorGame_s extends State<ColorGame>{

  @override
  void initState(){
    super.initState();
    color_select = color_list[color_rondom.nextInt(color_list.length)];
  }
  Widget build(BuildContext context){
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 30),
          Text('أختر اللون ${color_select} ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
          // TextButton(
          //     onPressed:() {
          //       setState(()=>color_select=color_list[color_rondom.nextInt(color_list.length)]);
          //       print(color_user);
          //     },
          //     child: Text('change color')),
          SizedBox(height: 30,),
          Container(
            child: Column(
              children: [
                color_row(Colors.red,'احمر',Colors.blue,'ازرق'),
                SizedBox(height: 80,),
                color_row(Colors.green,'اخضر',Colors.yellow,'اصفر'),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     GestureDetector(onTap: ()=>setState(()=>color_user='اخضر'),child: Container(height: 100,width: 100,color: Colors.green)),
                //     GestureDetector(onTap: ()=>setState(()=>color_user='اصفر'),child: Container(height: 100,width: 100,color: Colors.yellow)),
                //   ],
                // ),
              ],
            ),
          ),
          // ElevatedButton(onPressed: (){
          //   print('user=> ${color_user}');
          //   print('com => ${color_select}');
          //   if(color_user==color_select)
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Correct')));
          //   else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You Died')));
          //
          // },
          //     child: Text('Sumit'))
        ],
      ),
    );
  }

  Widget color_row(MaterialColor color_one,String select_one,MaterialColor color_two,String select_two){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        block(color_one,select_one),
        block(color_two, select_two)
        // GestureDetector(onTap: ()=>setState(()=>color_user=select_one),child: Container(height: 100,width: 100,color: color_one)),
        // GestureDetector(onTap: ()=>setState(()=>color_user=select_two),child: Container(height: 100,width: 100,color: color_two)),
      ],
    );
  }
  Widget block(MaterialColor color,String select){
    return GestureDetector(
        onTap: ()=>{
          setState((){
            color_user=select;
            block_bool=!block_bool;
          }),
          print('user=> ${color_user}'),
          print('com => ${color_select}'),
          if(color_user==color_select)
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('VICTORY'))),
              setState(()=>color_select=color_list[color_rondom.nextInt(color_list.length)],)
            }
          else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('YOU DIED'))),

        },
        child: Container(height: 120,width: 120,color: color));

  }
}


