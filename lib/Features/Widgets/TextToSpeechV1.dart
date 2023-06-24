import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';



class TextToSpeechV1  {

  TextToSpeech tts = TextToSpeech();

  void speak() {
    tts.setVolume(1.00);
    tts.setRate(0.93);
    tts.setLanguage('ar');
    tts.setPitch(1.44);
    tts.speak('احسنتْ يا محمودْ');
  }
}



