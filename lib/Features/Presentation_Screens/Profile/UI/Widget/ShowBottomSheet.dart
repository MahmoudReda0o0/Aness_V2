import 'package:flutter/material.dart';

import '../../../../../Core/constant.dart';


class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  //List<MaterialColor> color=List.generate(3, (index) =>Colors.blue);
  List<Color> colorList = List.generate(20, (index) {
    return MyColor().gray_wihte2;
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MyPageSize.height(context) * 0.9,
        width: MyPageSize.width(context),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          scrollDirection: Axis.vertical,
          childAspectRatio: (10 / 10),
          crossAxisCount: 3,
          children: List.generate(20, (index) {
            return GestureDetector(
              onTap: () async {
                setState(()=>colorList[index] = MyColor().pink);
                await Future.delayed(Duration(seconds: 1)).then(
                  (value) => Navigator.pop(context),
                );
                print('awiat done');
                setState(()=>colorList[index] = MyColor().gray_wihte2);
              },
              child: Container(
                height: 100,
                width: 100,
                color: colorList[index],
                child: Image(
                  image: AssetImage('assets/image/selectimage.png'),
                ),
              ),
            );
          }),
        ));
  }
}
