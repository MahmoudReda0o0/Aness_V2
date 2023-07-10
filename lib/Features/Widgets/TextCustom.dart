import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  TextCustom({required this.title,required this.fontsize, required this.color});
  String? title;
  Color? color;
  double? fontsize;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        '${title}',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: fontsize,
        ),
      ),
    );
  }
}
