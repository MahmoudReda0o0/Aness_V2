import 'package:autism_app/UI/Widgets/FreeWidget.dart';
import 'package:flutter/material.dart';

class MoreDetail extends StatefulWidget{
  State<StatefulWidget>createState()=>MoreDetail_s();
}
class MoreDetail_s extends State<MoreDetail>{
  final _formKey =  GlobalKey<FormState>();
  final _childNameController = TextEditingController();
  Widget build(BuildContext context){
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Stack(
        children: [
          Container(
            child: const Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/image/backscreen.png'),
            ),
          ),
          Column(
            children: [
             ButtonBar(
               children: [
                 ElevatedButton.icon(onPressed: (){},label: Text('ولد'),icon: Icon(Icons.boy),),

                 ElevatedButton.icon(onPressed: (){},label: Text('بنت'),icon: Icon(Icons.girl),),

               ],
             ),
              Padding(padding: EdgeInsets.all(8),child: FreeWidget().textformfield(controller: _childNameController, errorTitle: 'اعد ادخال اسم الطفل ', hintTitle: 'محمود مصطفي',lableText: 'اسم الطفل ',)),
              FreeWidget().elevatedForm(formKey: _formKey, context: context, buttonText: "التالي ", buttonWidth: _width),
            ],
          )
        ],
      ),
    );
  }
}