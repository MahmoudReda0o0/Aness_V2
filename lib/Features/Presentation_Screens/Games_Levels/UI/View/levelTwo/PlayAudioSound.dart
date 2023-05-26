// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
//
//
// class PlayAudioSound extends StatefulWidget {
//   const PlayAudioSound({Key? key}) : super(key: key);
//
//   @override
//   State<PlayAudioSound> createState() => _PlayAudioSoundState();
// }
//
// class _PlayAudioSoundState extends State<PlayAudioSound> {
//   final audioplayer =AudioPlayer();
//   bool isplaying = false ;
//   Duration duration = Duration.zero ;
//
//   @override
//   void initState(){
//     super.initState();
//     audioplayer.onPlayerStateChanged.listen((event) {
//       setState(() {
//         isplaying =event == PlayerState.PLAYING;
//       });
//     });
//
//     audioplayer.onDurationChanged.listen((event) {
//       setState(() {
//        duration = event;
//
//       });
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final player = AudioCache(prefix: 'assets/record/');
//     final url =  player.play('win.mp3');
//     audioplayer.setUrl(url.path , islocal:true);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Play Audio Sound'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: ElevatedButton(
//             onPressed: () async {
//               if(isplaying){
//                 await audioplayer.pause();
//               }
//               else{
//                 await audioplayer.play(url);
//               }
//             },
//             child: Icon(isplaying?Icons.pause:Icons.play_arrow),
//           ),)
//         ],
//       ),
//     );
//   }
// }
