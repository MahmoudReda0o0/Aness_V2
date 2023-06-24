import 'package:autism_app/Core/constant.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectFruitCubeCustom extends StatefulWidget {
  SelectFruitCubeCustom(
      {required this.imageURL,
      required this.cubeText,
      required this.answerText});
  String? imageURL;
  String? cubeText;
  String? answerText;

  @override
  State<SelectFruitCubeCustom> createState() => _SelectFruitCubeCustomState();
}

class _SelectFruitCubeCustomState extends State<SelectFruitCubeCustom> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderLevelForm>(builder: (context, _, child) {
      return GestureDetector(
        onTap: () async {
          if (widget.cubeText == widget.answerText) {
            // _.levelFormTabController?.animateTo(_.levelForminitPage--);
            await _.moveToNextGame(context: context);
            print('winbool: ${_.winpage}');
          } else {
            await _.tryGameAgain();
            print('losebool: ${_.losepage}');
          }
        },
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: MyColor().pink.withOpacity(0.1),
          ),
          child: Image.network('http://$PublicIP${widget.imageURL!}'),
        ),
      );
    });
  }
}
