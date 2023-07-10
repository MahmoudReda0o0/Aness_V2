import 'dart:async';
import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:autism_app/Features/Widgets/FreeWidget.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/AiFruitSound.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/ExpressiveGame.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/GameAnswer.dart';
import 'package:autism_app/Statemanagement/Provider/ApiProvider/AnessData/SocialGame.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../ApiData/AnessData/Post/AiFruitSound.dart';
import '../../../../../../Core/constant.dart';
import '../../../../../../Statemanagement/Provider/ApiProvider/AnessData/ChildProfile.dart';
import '../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
import '../../../../../../main.dart';
import '../../../../../Widgets/TextCustom.dart';
import '../../../../App_Start_Page/UI/View/StartPage.dart';
import '../../../../OfflineMode/Ui/view/OfflineGame.dart';
import '../../Widget/WinPage.dart';
import '../../Widget/gameBackImage.dart';
import '../../Widget/showWinFailPages.dart';

///
typedef _Fn = void Function();

const theSource = AudioSource.microphone;

/// Example app.
class ChatPage extends StatefulWidget {
  ChatPage({this.fun});
  Function? fun;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Codec _codec = Codec.aacMP4;
  String _mPath = '/data/user/0/com.example.autism_app/app_flutter/sound.mp4';
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  bool stopbool = false;
  late File _audioFile;
  Directory? directory;
  late AiSoundPredict aiSoundPredict;

  Future<Directory?> getTempDirectory() async {
    directory = await getTemporaryDirectory();
    return directory;
  }

  @override
  void initState() {
    chatState = 0;
    aiSoundPredict = AiSoundPredict();
    _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _mPlayer!.closePlayer();
    _mPlayer = null;

    _mRecorder!.closeRecorder();
    _mRecorder = null;
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
        _audioFile = File(_mPath);
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
    if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
      return null;
    }
    if (_mPlayer!.isStopped)
      return AiRecord();
    else {
      return stopRecorder();
    }
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
  int anessHelpCounter = 0;
  bool aneeshelp = false;
  int chatState = 0;
  bool buttonChild = false;
  bool winpage = false;

  @override
  Widget build(BuildContext context) {
    bool winPage = false;

    return Consumer3<ProviderSocialGame, ProviderLevelForm, ProviderAiSound>(
        builder: (context, P_Social, P_levelForm, P_AiSound, child) {
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            GameBackImage(),
            Container(
              height: MyPageSize.height(context),
              width: MyPageSize.width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextCustom(
                    title: 'أكمل الحوار مع صديقك أنيس',
                    fontsize: 16,
                    color: MyColor().gray,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ChatAnees(
                    chatImg: 'chatanees',
                    context: context,
                    visible: chatState == 1 ||
                        chatState == 2 ||
                        chatState == 3 ||
                        chatState == 4 ||
                        chatState == 5,
                    chatimage: 'chatanees',
                    alignmentGeometry: Alignment.centerRight,
                    apiText: P_Social
                        .apiResultSocial.socialModel!.messages![0].message!,
                  ),
                  ChatAnees(
                    chatImg: 'chatchild',
                    context: context,
                    chatimage: 'chat2',
                    visible: chatState == 2 ||
                        chatState == 3 ||
                        chatState == 4 ||
                        chatState == 5,
                    alignmentGeometry: Alignment.centerLeft,
                    apiText: P_Social
                        .apiResultSocial.socialModel!.messages![1].message!,
                  ),
                  // ChatAnees(
                  //   chatImg: 'chatanees',
                  //   context: context,
                  //   chatimage: 'chat3',
                  //   visible: chatState == 3 || chatState == 4 || chatState == 5,
                  //   alignmentGeometry: Alignment.centerRight,
                  //   apiText: P_Social
                  //       .apiResultSocial.socialModel!.messages![1].message!,
                  // ),
                  // ChatAnees(
                  //   chatImg: 'chatanees',
                  //   context: context,
                  //   chatimage: 'chat3',
                  //   visible: chatState == 4 || chatState == 5,
                  //   alignmentGeometry: Alignment.centerRight,
                  //   apiText: P_Social
                  //       .apiResultSocial.socialModel!.messages![1].message!,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: SizedBox(
                  //     height: 100,
                  //     width: 220,
                  //     child: ChatAnees(
                  //       chatImg: 'chatchild',
                  //       context: context,
                  //       chatimage: 'chat4',
                  //       visible: chatState == 4,
                  //       alignmentGeometry: Alignment.centerLeft,
                  //       apiText: P_Social
                  //           .apiResultSocial.socialModel!.messages![1].message!,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MyPageSize.height(context) * 0.9,
                ),
                ElevatedButton(
                  onPressed: () async {
                    switch (chatState) {
                      case 0:
                        await speak(
                            text:
                                '${P_Social.apiResultSocial.socialModel!.messages![0].message}');
                        setState(() => chatState++);
                        print('chatstate${chatState}');
                        break;
                      case 1:
                        P_levelForm.startTalkWave(talkWave: true);
                        record();
                        await Future.delayed(Duration(seconds: 5));
                        stopRecorder();
                        _audioFile = File(_mPath);
                        P_levelForm.startTalkWave(talkWave: false);
                        print('Ui stop recorder');
                        await P_AiSound.GetAiSoundResult(
                            audioFile: _audioFile,
                            label:
                                '${P_Social.apiResultSocial.socialModel!.messages![1].message}');
                        if (P_AiSound.aiSoundResult.levelComplete == true) {
                          setState(() {
                            chatState++;
                          });
                          await Future.delayed(Duration(milliseconds: 500));
                          print('Social ui game done');
                          print(
                              'levelcomplete: ${P_AiSound.aiSoundResult.levelComplete}');
                          P_levelForm.moveToNextGame(
                            context: context,
                          );
                        } else {
                          print('Social ui game failed');
                          print(
                              'levelcomplete: ${P_AiSound.aiSoundResult.levelComplete}');
                          P_levelForm.tryGameAgain();
                        }

                        print('chatstate${chatState}');
                        break;
                      case 2:
                        print('chatstate${chatState}');
                        break;
                      case 3:
                        print('chatstate${chatState}');
                        break;
                      case 4:
                        print('chatstate${chatState}');
                        break;
                      case 5:
                        print('chatstate${chatState}');
                        break;
                      default:
                    }
                    // setState(() {
                    //   buttonChild = true;
                    // });
                    // await Future.delayed(Duration(seconds: 1));
                    // setState(() {
                    //   chatState++;
                    //   buttonChild = false;
                    // });
                    // if (chatState == 5) {
                    //   setState(() {
                    //     winpage = true;
                    //   });
                    //   await Future.delayed(Duration(seconds: 5));
                    //   setState(() {
                    //     Provider.of<ProviderLevelForm>(context,listen: false).startPageInitController=0;
                    //   });
                    //   Navigator.pushReplacement(context,
                    //       MaterialPageRoute(builder: (context) => StartPage()));
                    //
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: MyColor().pink,
                      )),
                  child: Container(
                    height: 50,
                    width: MyPageSize.width(context) * 0.8,
                    child: Center(
                      child: P_levelForm.talkbutton
                          ? chatState == 1 || chatState == 3 || chatState == 5
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.mic,
                                      size: 25,
                                      color: MyColor().gray,
                                    ),
                                    TextCustom(
                                        title: 'استمع الي أنيس ',
                                        fontsize: 17,
                                        color: MyColor().gray),
                                  ],
                                )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mic,
                                  size: 25,
                                  color: MyColor().gray,
                                ),
                                TextCustom(
                                    title: chatState%2==0 ?' استمع الي أنيس ': ' اضغط للتحدث ',
                                    fontsize: 17,
                                    color: MyColor().gray),
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
            // Positioned(
            //   top: 150,
            //   left: 80,
            //   child: TextCustom(
            //     title: "الحمد لله",
            //     color: MyColor().gray,
            //     fontsize: 12,
            //   ),
            // ),
            ShowWinFailPage(),
          ],
        ),
      );
    });
  }

  Widget SizedBoxCustom() {
    return SizedBox(
      height: 40,
    );
  }

  Widget WaveImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage('assets/image/extra/voice.png'),
        ),
        Image(
          image: AssetImage('assets/image/extra/voice.png'),
        ),
        Image(
          image: AssetImage('assets/image/extra/voice.png'),
        ),
      ],
    );
  }

  Widget elevatedCustom({required String label}) {
    return ElevatedButton(
      onPressed: () async {
        await aiSoundPredict.PostFile(audioFile: _audioFile, label: label);
        FreeWidget().snackbar(
            context: context,
            content: aiSoundPredict.resultMessage,
            duration: 3);
      },
      child: Text(label),
    );
  }

  Widget ChatAnees({
    required BuildContext context,
    required bool visible,
    required String chatimage,
    required AlignmentGeometry alignmentGeometry,
    required String apiText,
    required String chatImg,
  }) {
    return Visibility(
      visible: visible,
      child: Container(
          margin: EdgeInsets.all(10),
          height: 80,
          width: MyPageSize.width(context),
          // color: Colors.pink,
          child: Stack(
            children: [
              Align(
                  alignment: alignmentGeometry,
                  child: Image(
                    image: AssetImage('assets/image/extra/$chatImg.png'),
                    fit: BoxFit.fitHeight,
                  )),
              Center(
                child: Text(
                  apiText,
                  style: TextStyle(fontSize: 20, color: MyColor().gray),
                ),
              )
            ],
          )),
    );
  }
}

// import 'dart:convert';
// import 'dart:io';
//
// import 'package:audio_session/audio_session.dart';
// import 'package:autism_app/Core/constant.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/public/flutter_sound_player.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
// import '../../../../../../ApiData/AnessData/Post/AiFruitSound.dart';
// import '../../../../../../Statemanagement/Provider/AppProvider/ProviderLevelFormOne.dart';
// import '../../../../../Widgets/TextCustom.dart';
// import '../../../../App_Start_Page/UI/View/StartPage.dart';
// import '../../../../OfflineMode/Ui/view/OfflineGame.dart';
// import '../../Widget/WinPage.dart';
// import '../../Widget/gameBackImage.dart';
// import '../../Widget/showWinFailPages.dart';
//
// const theSource = AudioSource.microphone;
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   Codec _codec = Codec.aacMP4;
//   String _mPath = '/data/user/0/com.example.autism_app/app_flutter/sound.mp4';
//   FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
//   FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
//   bool _mPlayerIsInited = false;
//   bool _mRecorderIsInited = false;
//   bool _mplaybackReady = false;
//   bool stopbool = false;
//   late File _audioFile;
//   Directory? directory;
//   late AiFruitSound aiFruitSound;
//
//   Future<Directory?> getTempDirectory() async {
//     directory = await getTemporaryDirectory();
//     return directory;
//   }
//
//   @override
//   void initState() {
//     aiFruitSound = AiFruitSound();
//     _mPlayer!.openPlayer().then((value) {
//       setState(() {
//         _mPlayerIsInited = true;
//       });
//     });
//
//     openTheRecorder().then((value) {
//       setState(() {
//         _mRecorderIsInited = true;
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _mPlayer!.closePlayer();
//     _mPlayer = null;
//
//     _mRecorder!.closeRecorder();
//     _mRecorder = null;
//     super.dispose();
//   }
//
//   Future<void> openTheRecorder() async {
//     if (!kIsWeb) {
//       var status = await Permission.microphone.request();
//       if (status != PermissionStatus.granted) {
//         throw RecordingPermissionException('Microphone permission not granted');
//       }
//     }
//     await _mRecorder!.openRecorder();
//     if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
//       _codec = Codec.opusWebM;
//       _mPath = '/data/user/0/com.example.autism_app/app_flutter/sound.mp4';
//       if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
//         _mRecorderIsInited = true;
//         return;
//       }
//     }
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration(
//       avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
//       avAudioSessionCategoryOptions:
//       AVAudioSessionCategoryOptions.allowBluetooth |
//       AVAudioSessionCategoryOptions.defaultToSpeaker,
//       avAudioSessionMode: AVAudioSessionMode.spokenAudio,
//       avAudioSessionRouteSharingPolicy:
//       AVAudioSessionRouteSharingPolicy.defaultPolicy,
//       avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
//       androidAudioAttributes: const AndroidAudioAttributes(
//         contentType: AndroidAudioContentType.speech,
//         flags: AndroidAudioFlags.none,
//         usage: AndroidAudioUsage.voiceCommunication,
//       ),
//       androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
//       androidWillPauseWhenDucked: true,
//     ));
//
//     _mRecorderIsInited = true;
//   }
//
//   // ----------------------  Here is the code for recording and playback -------
//
//   Future<File> DirAudioFile() async {
//     Directory path = await getApplicationDocumentsDirectory();
//     File audioFile = File('${path}/sound.mp4');
//     return audioFile;
//   }
//
//   void record() {
//     _mRecorder!
//         .startRecorder(
//       toFile: _mPath,
//       codec: _codec,
//       audioSource: theSource,
//     )
//         .then((value) {
//       setState(() {});
//     });
//   }
//
//   void stopRecorder() async {
//     await _mRecorder!.stopRecorder().then((value) {
//       setState(() {
//         //var url = value;
//         _audioFile = File(_mPath);
//         stopbool = true;
//         _mplaybackReady = true;
//       });
//     });
//   }
//
//   void play() {
//     assert(_mPlayerIsInited &&
//         _mplaybackReady &&
//         _mRecorder!.isStopped &&
//         _mPlayer!.isStopped);
//     _mPlayer!
//         .startPlayer(
//         fromURI: _mPath,
//         //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
//         whenFinished: () {
//           setState(() {});
//         })
//         .then((value) {
//       setState(() {});
//     });
//   }
//
//   void stopPlayer() {
//     _mPlayer!.stopPlayer().then((value) {
//       setState(() {});
//     });
//   }
//
// // ----------------------------- UI --------------------------------------------
//
//   getRecorderFn() {
//     if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
//       return null;
//     }
//     if (_mPlayer!.isStopped)
//       return AiRecord();
//     else {
//       return stopRecorder();
//     }
//   }
//
//   Future AiRecord() async {
//     record();
//     await Future.delayed(Duration(seconds: 5));
//     stopRecorder();
//   }
//
//   _Fn? getPlaybackFn() {
//     if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
//       return null;
//     }
//     return _mPlayer!.isStopped ? play : stopPlayer;
//   }
//

//   @override
//   void initState() {
//     chatState = 0;
//   }
//   @override
//   Widget build(BuildContext context) {

//   }
//
