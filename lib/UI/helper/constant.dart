

import 'package:flutter/material.dart';


class MyColor{
  var pink =Color(0xfff79999);
  var pink_white=Color(0xffffebe5);
  var gray=Color(0xFF4f6271);
  var gray_white =Color(0xff899cb1);
  var gray_wihte2=Color(0xffE0E5EC);
}

class MyPageSize{
  MyPageSize(BuildContext context);


  static double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}