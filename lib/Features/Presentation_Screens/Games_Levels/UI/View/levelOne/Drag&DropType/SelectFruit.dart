// import 'dart:math';
//
//
//
// import 'package:autism_app/Core/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
// import '../../../../../../Widgets/TextCustom.dart';
// import '../../../Widget/LosePage.dart';
// import '../../../Widget/WinPage.dart';
// import '../../../Widget/gamelist.dart';
//
//
// class SelectFruit extends StatefulWidget {
//   const SelectFruit({Key? key}) : super(key: key);
//
//   @override
//   State<SelectFruit> createState() => _SelectFruitState();
// }
//
// String selectedFruit = '';
// Random random = Random();
// int? FruitRand;
//
// class _SelectFruitState extends State<SelectFruit> {
//   bool winPage = false;
//   bool losePage = false;
//   int a = 0;
//   String bb = 'nuull';
//   bool aaa = false;
//   @override
//   void initState() {
//     super.initState();
//     FruitRand = random.nextInt(GameList.FruitName.length);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // GameBackImage(),
//         SafeArea(
//           child: Container(
//             height: MyPageSize.height(context),
//             width: MyPageSize.width(context),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextCustom(
//                     title: 'اختر الفاكهة الصحيحة',
//                     fontsize: 18,
//                     color: MyColor().gray),
//                 SizedBox(
//                   height: 20,
//
//                 ),
//                 TextCustom(
//                     title: GameList.FruitNameArabic[FruitRand!],
//                     fontsize: 30,
//                     color: MyColor().pink),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Consumer<ProviderLevelForm>(
//                   builder: (context, ProviderLevel, child) {
//                     return DragTarget<String>(
//                       onAccept: (data) async {
//                         if (data == GameList.FruitName[FruitRand!]) {
//                           setState(() {
//                             winPage = true;
//                           });
//                           await Future.delayed(Duration(seconds: 5));
//                           setState(() {
//
//                             ProviderLevel.LevelProgress=1;
//                             ProviderLevel.initTabPage=1;
//                             ProviderLevel.levelFormTabController?.animateTo(1);
//                             winPage = false;
//                           });
//                           function();
//                         } else {
//                           setState(() {
//                             losePage = true;
//                           });
//                           await Future.delayed(Duration(seconds: 2));
//                           setState(() {
//                             losePage = false;
//                           });
//                         }
//                         setState(() {
//                           selectedFruit = data;
//                         });
//                       },
//                       builder: (context, data, rejecteddata) {
//                         return Container(
//                           height: 180,
//                           width: 180,
//                           child: Opacity(
//                             opacity: 0.5,
//                             child: Image(
//                               image: AssetImage(
//                                   'assets/image/games/${GameList.FruitName[FruitRand!]}.png'),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 // Center(
//                 //   child: Draggable<String>(
//                 //     data: "apple",
//                 //     child: Container(
//                 //       height: 120,
//                 //       width: 120,
//                 //       child: Image(
//                 //         image: AssetImage('assets/image/games/apple.png'),
//                 //       ),
//                 //     ),
//                 //     feedback: Container(
//                 //       height: 120,
//                 //       width: 120,
//                 //       child: Image(
//                 //         image: AssetImage('assets/image/games/apple.png'),
//                 //       ),
//                 //     ),
//                 //     childWhenDragging: Container(height: 120, width: 120),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     DragFruit(data: 'Apple', FruitImage: 'Apple'),
//                     DragFruit(data: 'Banana', FruitImage: "Banana"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     DragFruit(data: 'Mango', FruitImage: 'Mango'),
//                     DragFruit(data: 'Watermelon', FruitImage: 'Watermelon'),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Center(
//           child: winPage ? WinPage() : SizedBox(),
//         ),
//         Center(
//           child: losePage ? LosePage() : SizedBox(),
//         ),
//       ],
//     );
//   }
//
//   Widget DragFruit({required String data, required String FruitImage}) {
//     return Draggable<String>(
//       data: data,
//       child: Container(
//         height: 120,
//         width: 120,
//         child: Image(
//           image: AssetImage('assets/image/games/${FruitImage}.png'),
//         ),
//       ),
//       feedback: Container(
//         height: 120,
//         width: 120,
//         child: Image(
//           image: AssetImage('assets/image/games/${FruitImage}.png'),
//         ),
//       ),
//       childWhenDragging: Container(height: 130, width: 130),
//     );
//   }
//
//   Function function() {
//     return () {
//       setState(() {
//         a = 4;
//         bb = 'function text';
//       });
//       a = 999;
//       print('new function is ready');
//     };
//   }
// }
