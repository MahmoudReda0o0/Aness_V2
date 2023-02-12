

import 'package:flutter/material.dart';


class MyColor{
  var pink =Color(0xfff79999);
  var pink_white=Color(0xffffebe5);
  var gray=Color(0xFF4f6271);
  var gray_white =Color(0xff899cb1);
}

class MyPageSize{

  double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}