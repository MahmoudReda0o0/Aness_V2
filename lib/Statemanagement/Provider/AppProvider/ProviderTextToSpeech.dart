// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:text_to_speech/text_to_speech.dart';
//
// class ProviderTextToSpeech extends ChangeNotifier{
//   List<String> WinWords=['أحسنتَ يا محمودْ','أنا فخورٌ بكَ يا محمودْ','ممتاز يا محمودْ','كمْ أنتَ ذكيُ يا محمودْ'];
//
//   Random random =Random();
//
//   TextToSpeech tts = TextToSpeech();
//
//   void speak() {
//     tts.setVolume(1.00);
//     tts.setRate(0.93);
//     tts.setLanguage('ar');
//     tts.setPitch(1.44);
//     tts.speak('${WinWords[random.nextInt(4)]}');
//   }
//
//
// }