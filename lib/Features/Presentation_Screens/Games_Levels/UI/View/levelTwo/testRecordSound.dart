import 'dart:async';
import 'dart:io';
//import 'package:audio/Feature/Presintation/SoundRedorder/Data/ApiServisesFruit.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';


///
typedef _Fn = void Function();

const theSource = AudioSource.microphone;

/// Example app.
class SimpleRecorder extends StatefulWidget {
  @override
  _SimpleRecorderState createState() => _SimpleRecorderState();
}

class _SimpleRecorderState extends State<SimpleRecorder> {
  Directory? directory;
  Codec _codec = Codec.aacMP4;
  late String _mPath = '/data/user/0/com.example.audio/app_flutter/sound.mp4';
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  late File _audioFile;
 // late File AudioFile;
  //late ApiServisesFruit apiServises;

  Future<Directory?> getTempDirectory () async {
    directory = await getTemporaryDirectory();
    return directory;
  }
  @override
  void initState() {
    getTemporaryDirectory();
   // apiServises = ApiServisesFruit();
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
      _mPath = 'tau_file.mp4';
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

  // ----------recording and playback Audio-------


  Future<File> DirAudioFile () async {
    Directory path = await getApplicationDocumentsDirectory();
    File audioFile = File('${path}/sound.mp4');
    return audioFile;
  }

  Future<void> record() async {
    File audio = await DirAudioFile();
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      //toFile:_mPath,
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {});
      print('''
      audio :${ audio.path }
      absolute ${audio.absolute.path}
      ''');
    });

  }

  void stopRecorder() async {
    File audio= await DirAudioFile();
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
        //var url = value;
        _audioFile = File(_mPath);
        //AudioFile = audio ;
        // print(
        //     'stop record and save audio :${AudioFile} in path : ${AudioFile.path}, ');
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

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
      return null;
    }
    if(_mPlayer!.isStopped) return AiRecord;
    else { return stopRecorder;}
    // else return stopRecorder;
    //return record;
  }

  Future<_Fn?> AiRecord() async {
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

  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getRecorderFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,

                child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(_mRecorder!.isRecording
                  ? 'Recording in progress'
                  : 'Recorder is stopped'),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: getPlaybackFn(),
                  //color: Colors.white,
                  //disabledColor: Colors.grey,
                  child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(_mPlayer!.isPlaying
                    ? 'Playback in progress'
                    : 'Player is stopped'),
              ],
            ),
          ),
          Center(
            child: Text('File Path :${_mPath}'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // apiServises.PostFile(
                //   audioFile: _audioFile,
                // );
                print('audio file :  and file Path is ${_audioFile.path}');
              },
              child: Center(
                child: Text('Upload Audio File'),
              ),
            ),
          ),
          //Center(child: Text('audio file : ${_audioFile??'wating'} and file Path is ${_audioFile.path}'),),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Simple Recorder'),
      ),
      body: makeBody(),
    );
  }
}
