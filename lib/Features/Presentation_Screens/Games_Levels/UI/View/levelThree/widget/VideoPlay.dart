import 'dart:async';

//import 'package:audio/Feature/Presintation/VideoPlayer/widget/VideoPlayerWidget.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/SocialGame.dart';
import 'package:autism_app/Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import 'package:autism_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'VideoPlayerWidget.dart';

class VideoPlay extends StatefulWidget {


  @override
  State<VideoPlay> createState() => _VideoPlayState();
}
int? videoIndex = navigationKey.currentContext!.read<ProviderLevelForm>().levelMapGameIndex ==4?1:2;
late VideoPlayerController videoController;
class _VideoPlayState extends State<VideoPlay> {
  String assetVideo = 'assets/video/talkvideo${videoIndex}.mp4';
 // late VideoPlayerController videoController;
  StreamController streamDuration = StreamController();
  int videoDuration = 6;

  void startTimer () async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      videoDuration --;
      streamDuration.sink.add(videoDuration);

      if(videoDuration <= 0){
        timer.cancel();
        streamDuration.close();
      }

    });
  }

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset(assetVideo)
      ..addListener(() {
        setState(() {
          //videoDuration = videoController.value.duration;
        });
      })
      ..setLooping(true)
      ..initialize().then((value) => videoController.pause());

  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isstop = true;
    int duration = videoController.value.duration.inSeconds;
    var isMute = videoController.value.volume == 00;

    return Container(
      height: 200,
      width: 300,
      child: VideoPlayerWidget(controller: videoController),
    );
    // return Scaffold(
    //     // appBar: AppBar(
    //     //   title: Text('game Api Test'),
    //     //   centerTitle: true,
    //     // ),
    //     body: Column(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           height: 200,
    //           width: 300,
    //           child: VideoPlayerWidget(controller: videoController),
    //         ),
    //         SizedBox(
    //           height: 30,
    //         ),
    //         if (videoController != null && videoController.value.isInitialized)
    //           CircleAvatar(
    //             radius: 30,
    //             backgroundColor: Colors.red,
    //             child: IconButton(
    //               icon: Icon(
    //                 isMute ? Icons.volume_mute_outlined : Icons.volume_up,
    //               ),
    //               onPressed: () {
    //                 setState(() {
    //                   isMute != isMute;
    //                 });
    //                 print(isMute);
    //                 videoController.setVolume(isMute ? 1 : 0);
    //               },
    //             ),
    //           ),
    //         if (videoController != null && videoController.value.isInitialized)
    //           CircleAvatar(
    //             radius: 30,
    //             backgroundColor: Colors.red,
    //             child: IconButton(
    //               icon: Icon(
    //                 isstop ? Icons.play_arrow : Icons.stop,
    //               ),
    //               onPressed: () {
    //                 setState(() {
    //                   isstop != isstop;
    //                 });
    //                 print(isstop);
    //               },
    //             ),
    //           ),
    //         ElevatedButton(
    //             onPressed: () {
    //               setState(() {
    //                 startTimer();
    //               });
    //             },
    //             child: Text('')),
    //         if (videoController.value.duration.inSeconds > 5)
    //           Center(
    //             child: Text('${videoDuration}'),
    //           ),
    //         StreamBuilder(
    //             initialData: videoDuration,
    //             stream: streamDuration.stream,
    //             builder: (context,snapshot){
    //               if(snapshot.hasData){
    //                 return Center(child: Text('Video is small '),);
    //               }
    //               else if (snapshot.hasError)
    //                 return Center(child: Text('Str${snapshot.error.toString()}'),);
    //               else
    //                 return Center(child:CircularProgressIndicator());
    //             }),
    //
    //       ],
    //     ));
  }
}



// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   Future<ApiReceptiveResult>? apiResult;
//
//   GameAnswer answer = GameAnswer();
//   @override
//   void initState() {
//     super.initState();
//     // apiResult = ApiServesesReceptiveGame().getReceptiveData(level: 1);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String name = 'خالد';
//     Map<String, String> alpha = {
//       "د": "دْ",
//     };
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('game Api Test'),
//         centerTitle: true,
//       ),
//       body: Consumer<ProviderChildProfile>(
//         builder: (context, _, child) {
//           return Center(
//             child: ElevatedButton(
//               onPressed: () {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>TalkToAnees()));
//               },
//               child: FlutterLogo(size: 20),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
