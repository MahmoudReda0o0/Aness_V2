import 'dart:async';
import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:autism_app/Features/Widgets/FreeWidget.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/AiFruitSound.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ExpressiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/GameAnswer.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ReceptiveGame.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../ApiData/AnessData/Post/AiFruitSound.dart';
import '../../../../../../Core/constant.dart';
import '../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../../Widgets/TextCustom.dart';
import '../../../../App_Start_Page/UI/View/StartPage.dart';
import '../../Widget/WinPage.dart';
import '../../Widget/showWinFailPages.dart';

///
typedef _Fn = void Function();

const theSource = AudioSource.microphone;

/// Example app.
class RecordFruitSound extends StatefulWidget {
  RecordFruitSound({this.fun});
  Function? fun;
  @override
  _RecordFruitSoundState createState() => _RecordFruitSoundState();
}

class _RecordFruitSoundState extends State<RecordFruitSound> {
  Codec _codec = Codec.aacMP4;
  String _mPath = '/data/user/0/com.example.autism_app/app_flutter/sound.mp4';
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
 late FlutterSoundRecorder _mRecorder ;
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  bool stopbool = false;
  late File _audioFile;
  Directory? directory;
  late AiSoundPredict aiFruitSound;

  Future<Directory?> getTempDirectory() async {
    directory = await getTemporaryDirectory();
    return directory;
  }

  @override
  void initState() {
    aiFruitSound = AiSoundPredict();


    _mRecorder =FlutterSoundRecorder();

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });

    _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _mPlayer!.closePlayer();
    _mPlayer = null;

    _mRecorder!.closeRecorder();

    super.dispose();
  }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder!.openRecorder();
    if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = '/data/user/0/com.example.autism_app/app_flutter/sound.mp4';
      if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

  // ----------------------  Here is the code for recording and playback -------

  Future<File> DirAudioFile() async {
    Directory path = await getApplicationDocumentsDirectory();
    File audioFile = File('${path}/sound.mp4');
    return audioFile;
  }

  void record() {
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {});
    });
  }

  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
        //var url = value;

        stopbool = true;
        _mplaybackReady = true;
      });
    });
  }

  void play() {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    _mPlayer!
        .startPlayer(
            fromURI: _mPath,
            //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {});
    });
  }

  void stopPlayer() {
    _mPlayer!.stopPlayer().then((value) {
      setState(() {});
    });
  }

// ----------------------------- UI --------------------------------------------

   getRecorderFn() {
    if ( !_mRecorderIsInited ) {
      return null;
    }
      return AiRecord();
    // else {
    //   return stopRecorder();
    // }
  }

  Future AiRecord() async {
    record();
    await Future.delayed(Duration(seconds: 5));
    stopRecorder();
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped ? play : stopPlayer;
  }
  bool anessHelpBool = false;
  int anessHelpCounter=0;
  bool aneeshelp =false;

  @override
  Widget build(BuildContext context) {
    // Widget makeBody() {
    //   return
    // }
    return Consumer5<ProviderExpressiveGame, ProviderGameAnswer,
            ProviderLevelForm,ProviderAiSound,ProviderReceptiveGame>(
        builder: (context, P_exp, P_gameAnswer, P_levelForm,P_AiSound,_Rec, child) {
      return Stack(children: [
        // Column(
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.all(3),
        //       padding: const EdgeInsets.all(3),
        //       height: 80,
        //       width: double.infinity,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: Color(0xFFFAF0E6),
        //         border: Border.all(
        //           color: Colors.indigo,
        //           width: 3,
        //         ),
        //       ),
        //       child: Row(
        //         children: [
        //           ElevatedButton(
        //             onPressed: getRecorderFn(),
        //             //color: Colors.white,
        //             //disabledColor: Colors.grey,
        //             child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
        //           ),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Text(_mRecorder!.isRecording
        //               ? 'Recording in progress'
        //               : 'Recorder is stopped'),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       margin: const EdgeInsets.all(3),
        //       padding: const EdgeInsets.all(3),
        //       height: 80,
        //       width: double.infinity,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: Color(0xFFFAF0E6),
        //         border: Border.all(
        //           color: Colors.indigo,
        //           width: 3,
        //         ),
        //       ),
        //       child: Row(
        //         children: [
        //           ElevatedButton(
        //             onPressed: getPlaybackFn(),
        //             //color: Colors.white,
        //             //disabledColor: Colors.grey,
        //             child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
        //           ),
        //           SizedBox(
        //             width: 20,
        //           ),
        //           Text(_mPlayer!.isPlaying
        //               ? 'Playback in progress'
        //               : 'Player is stopped'),
        //         ],
        //       ),
        //     ),
        //     Center(child: stopbool ? Text('${_audioFile.path}') : SizedBox()),
        //     // Center(
        //     //   child: Image.network(
        //     //       'http://54.86.189.155${P_exp.expressiveModel.img}'),
        //     // ),
        //     Center(
        //       child: ElevatedButton(
        //         onPressed: () async {
        //           await aiFruitSound.PostFile(
        //               audioFile: _audioFile,
        //               label: '${P_exp.expressiveModel.answer}');
        //           FreeWidget().snackbar(
        //               context: context,
        //               content: aiFruitSound.resultMessage,
        //               duration: 3);
        //         },
        //         child: Text('${P_exp.expressiveModel.answer}'),
        //       ),
        //     ),
        //     Center(
        //       child: ElevatedButton(
        //         onPressed: () async {
        //           await aiFruitSound.PostFile(
        //               audioFile: _audioFile, label: 'تفاح');
        //           FreeWidget().snackbar(
        //               context: context,
        //               content: aiFruitSound.resultMessage,
        //               duration: 3);
        //           if (aiFruitSound.gameComplete == true) {
        //             await P_gameAnswer.PostAnswerGame(
        //                 GameType: 'expressive', LevelNumber: 1);
        //             print('ui output levelComplete');
        //           } else {
        //             print('ui output level not Complete');
        //           }
        //         },
        //         child: Text('تفاح'),
        //       ),
        //     ),
        //     Center(
        //       child: ElevatedButton(
        //         onPressed: () async {
        //           await aiFruitSound.PostFile(
        //               audioFile: _audioFile, label: 'بطيخ');
        //           FreeWidget().snackbar(
        //               context: context,
        //               content: aiFruitSound.resultMessage,
        //               duration: 3);
        //           if (aiFruitSound.gameComplete == true) {
        //             await P_gameAnswer.PostAnswerGame(
        //                 GameType: 'expressive', LevelNumber: 1);
        //             print('ui output levelComplete');
        //           } else {
        //             print('ui output level not Complete');
        //           }
        //         },
        //         child: Text('بطيخ'),
        //       ),
        //     ),
        //     Center(
        //       child: ElevatedButton(
        //         onPressed: () async {
        //           await aiFruitSound.PostFile(
        //               audioFile: _audioFile, label: 'موز');
        //           FreeWidget().snackbar(
        //               context: context,
        //               content: aiFruitSound.resultMessage,
        //               duration: 3);
        //           if (aiFruitSound.gameComplete == true) {
        //             await P_gameAnswer.PostAnswerGame(
        //                 GameType: 'expressive', LevelNumber: 1);
        //             print('ui output levelComplete');
        //           } else {
        //             print('ui output level not Complete');
        //           }
        //         },
        //         child: Text('موز'),
        //       ),
        //     ),
        //   ],
        // ),
        SafeArea(
          child: Container(
            height: MyPageSize.height(context),
            width: MyPageSize.width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(
                    title: "أذكر اسم الفاكهة التي أمامك",
                    fontsize: 20,
                    color: MyColor().gray),
                SizedBoxCustom(),
                Container(
                  height: 200,
                  width: 200,
                  //color: Colors.pink,
                  child: Image.network(
                      'http://$PublicIP${P_exp.expressiveModel.img}'),
                ),
                SizedBoxCustom(),
                // SizedBox(
                //     width: MyPageSize.width(context) * 0.9,
                //     child: TextCustom(
                //         title: P_exp.expressiveModel.answer,
                //         fontsize: 18,
                //         color: MyColor().gray),
                // ),
                SizedBoxCustom(),
                ElevatedButton(
                 //onPressed: getRecorderFn(),
                  //onLongPress: getPlaybackFn,
                  onPressed: () async {
                    P_levelForm.startTalkWave(talkWave: true);
                    // await getRecorderFn();
                    record();
                    await Future.delayed(Duration(seconds: 5));
                    stopRecorder();
                    _audioFile = File(_mPath);
                     P_levelForm.startTalkWave(talkWave: false);
                     print('Ui stop recorder');
                     print('audio file : ${_audioFile.path}');
                     await P_AiSound.GetAiSoundResult(audioFile: _audioFile, label: '${P_exp.expressiveModel.answer}');
                    // await aiFruitSound.PostFile(
                    //     audioFile: _audioFile, label: '${P_exp.expressiveModel.answer}');

                    //P_levelForm.startTalkWave(talkWave: false);
                    // FreeWidget().snackbar(
                    //     context: context,
                    //     content: 'Snack Show Message',
                    //     duration: 3);
                    print('Ui level complete:${P_AiSound.aiSoundResult.levelComplete}');
                    if(P_AiSound.aiSoundResult.levelComplete==true){
                      P_levelForm.moveToNextGame(context: context,);
                      //P_levelForm.moveToNextGame(context: context,page: StartPage());
                    }
                    else{
                      P_levelForm.tryGameAgain();
                      setState(()=>anessHelpCounter++);
                      if(anessHelpCounter >=2){
                        setState(()=>anessHelpBool =true);
                      }
                      else {
                        setState(()=>anessHelpBool=false);
                      }
                      print('anessHelpcounter: $anessHelpCounter , anessbool: $anessHelpBool');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: MyColor().pink,
                    ),
                  ),
                  child: Container(
                    height: 50,
                    width: MyPageSize.width(context) * 0.8,
                    child: Center(
                      child: P_levelForm.talkbutton
                          ? WaveImage()
                          : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mic,
                                  size: 25,
                                  color: MyColor().gray,
                                ),
                                TextCustom(
                                    title: 'اضغط للتحدث',
                                    fontsize: 17,
                                    color: MyColor().gray),

                              ],
                            ),
                    ),
                  ),
                ),
                SizedBoxCustom(),
                anessHelpBool ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                           aneeshelp = true;
                        });
                        P_levelForm.speak(text: '${P_exp.expressiveModel.answer}');
                        await Future.delayed(Duration(seconds: 2));
                        setState(() {
                           aneeshelp = false;
                        });
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: aneeshelp
                                ? MyColor().pink
                                : MyColor().gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15)),
                        //color: Colors.pink,
                        child: Image(
                          image: AssetImage('assets/image/aneeshelp.png'),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        TextCustom(
                            title: 'صديقك أنيس هنا للمساعدة',
                            fontsize: 15,
                            color: MyColor().pink),
                        SizedBox(
                          height: 20,
                        ),
                        TextCustom(
                            title: 'اضغط لسماع اسم الصورة ',
                            fontsize: 13,
                            color: MyColor().gray)
                      ],
                    ),
                  ],
                ):SizedBox(),
              ],
            ),
          ),
        ),
        ShowWinFailPage(),
      ]);
    });
  }

  Widget SizedBoxCustom() {
    return SizedBox(
      height: 40,
    );
  }
  Widget WaveImage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage(
              'assets/image/extra/voice.png'),
        ),
        Image(
          image: AssetImage(
              'assets/image/extra/voice.png'),
        ),
        Image(
          image: AssetImage(
              'assets/image/extra/voice.png'),
        ),
      ],
    );
  }

  Widget elevatedCustom({required String label}) {
    return ElevatedButton(
      onPressed: () async {
        await aiFruitSound.PostFile(audioFile: _audioFile, label: label);
        FreeWidget().snackbar(
            context: context, content: aiFruitSound.resultMessage, duration: 3);
      },
      child: Text(label),
    );
  }
}


// ButtonBar(
//   children: [
//     Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           await aiFruitSound.PostFile(
//               audioFile: _audioFile, label: 'خوخ');
//           FreeWidget().snackbar(
//               context: context,
//               content: aiFruitSound.resultMessage,
//               duration: 3);
//           if (aiFruitSound.gameComplete == true) {
//             await P_gameAnswer.PostAnswerGame(
//                 GameType: 'expressive', LevelNumber: 1);
//             print('ui output levelComplete');
//           } else {
//             print('ui output level not Complete');
//           }
//         },
//         child: Text('خوخ'),
//       ),
//     ),
//     Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           await aiFruitSound.PostFile(
//               audioFile: _audioFile, label: 'بطيخ');
//           FreeWidget().snackbar(
//               context: context,
//               content: aiFruitSound.resultMessage,
//               duration: 3);
//           if (aiFruitSound.gameComplete == true) {
//             await P_gameAnswer.PostAnswerGame(
//                 GameType: 'expressive', LevelNumber: 1);
//             print('ui output levelComplete');
//           } else {
//             print('ui output level not Complete');
//           }
//         },
//         child: Text('بطيخ'),
//       ),
//     ),
//     Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           await aiFruitSound.PostFile(
//               audioFile: _audioFile, label: 'موز');
//           FreeWidget().snackbar(
//               context: context,
//               content: aiFruitSound.resultMessage,
//               duration: 3);
//           if (aiFruitSound.gameComplete == true) {
//             await P_gameAnswer.PostAnswerGame(
//                 GameType: 'expressive', LevelNumber: 1);
//             print('ui output levelComplete');
//           } else {
//             print('ui output level not Complete');
//           }
//         },
//         child: Text('موز'),
//       ),
//     ),
//     Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           await aiFruitSound.PostFile(
//               audioFile: _audioFile, label: 'تفاح');
//           FreeWidget().snackbar(
//               context: context,
//               content: aiFruitSound.resultMessage,
//               duration: 3);
//           if (aiFruitSound.gameComplete == true) {
//             await P_gameAnswer.PostAnswerGame(
//                 GameType: 'expressive', LevelNumber: 1);
//             print('ui output levelComplete');
//           } else {
//             print('ui output level not Complete');
//           }
//         },
//         child: Text('تفاح'),
//       ),
//     ),
//     Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           await aiFruitSound.PostFile(
//               audioFile: _audioFile, label: 'توت');
//           FreeWidget().snackbar(
//               context: context,
//               content: aiFruitSound.resultMessage,
//               duration: 3);
//           if (aiFruitSound.gameComplete == true) {
//             await P_gameAnswer.PostAnswerGame(
//                 GameType: 'expressive', LevelNumber: 1);
//             print('ui output levelComplete');
//           } else {
//             print('ui output level not Complete');
//           }
//         },
//         child: Text('توت'),
//       ),
//     ),
//   ],
// ),
// SizedBox(
//   height: 30,
// )
// ElevatedButton(
//   onPressed: (){
//     speechToText.stop();
//   },
//   style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.white,
//       side: BorderSide(
//         color: MyColor().pink,
//       )
//   ),
//   child: Container(
//     height: 50,
//     width: MyPageSize.width(context)*0.8,
//     child: Center(
//       child: Wrap(
//         children: [
//           TextCustom(title: 'Stop', fontsize: 17, color:MyColor().gray),
//           Icon(Icons.mic,size: 25,color: MyColor().gray,),
//         ],
//       ),
//     ),
//   ),
// ),
