import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class RecoordSoundFruit extends StatefulWidget {
  const RecoordSoundFruit({Key? key}) : super(key: key);

  @override
  State<RecoordSoundFruit> createState() => _RecoordSoundFruitState();
}

class _RecoordSoundFruitState extends State<RecoordSoundFruit> {
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw ' Microphon permission not granted';
    }
    await recorder.openRecorder();
    isRecorderReady =true;

    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  Future record() async {
    if(!isRecorderReady) return ;
    await recorder.startRecorder(toFile: 'record');
  }

  Future stop() async {
    if(!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print("Recorded audio : $audioFile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Sound'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<RecordingDisposition>(
            stream: recorder.onProgress,
            builder: (context, snapshot) {
              Duration? duration =
                  snapshot.hasData ? snapshot.data?.duration : Duration.zero;
              return Center(
                child: Text('${duration?.inSeconds} s ' ),
              );
            },
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (recorder.isRecording) {
                  await stop();
                } else {
                  await record();
                }
                setState(() {

                });
              },
              child: Icon(
                  recorder.isRecording ? Icons.stop_circle : Icons.mic_none),
            ),
          ),
          Center(child: ElevatedButton(
            onPressed: (){
              recorder.startRecorder();
            },
            child: Icon(Icons.play_arrow),
          ),)
        ],
      ),
    );
  }
}
