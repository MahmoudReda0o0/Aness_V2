import 'package:autism_app/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Statemanagement/Provider/AppProvider/ProviderData.dart';



class DragableCustom extends StatelessWidget {
  DragableCustom({required this.data,required this.image,});
  String? data;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: data,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyColor().pink.withOpacity(0.1),
          ),
          height: 140,
          width: 140,
          child: Image.network ('http://$PublicIP$image'),
        ),
      ),
      feedback: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //color: MyColor().pink.withOpacity(0.1),
          ),
          height: 140,
          width: 140,
          child: Image.network('http://$PublicIP$image')
        ),
      ),
      childWhenDragging: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColor().pink.withOpacity(0.1),
        ),
        height: 140,
        width: 140,
      ),
    );
  }
}
