import 'dart:convert';

import '../../../Core/constant.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;
import 'dart:io';

import 'package:http/http.dart';

import '../../../main.dart';
import '../../Models/AiSoundModel.dart';

class AiSoundResult{
  bool? hasError;
  AiSoundModel? aiSoundModel;
  String ErrorMessage='';
  bool? levelComplete=false;
}


class AiSoundPredict {
  var headers = {
    'Authorization': 'JWT $GlobalAccessToken'
  };

  bool gameComplete =false ;
   String resultMessage='nothing loaded';
  Future<AiSoundResult> PostFile ({required File audioFile,required String label}) async {
    AiSoundResult aiSoundResult = AiSoundResult();
    try{
      MultipartRequest request = http.MultipartRequest('POST', Uri.parse('http://$PublicIP/api/predict/'));
      request.files.add(await http.MultipartFile.fromPath('file', audioFile.path));
      request.fields.addAll({'label': '$label'});
      print('aipath  : ${audioFile.path}');
      request.headers.addAll(headers);

      var response = await request.send();

      if(response.statusCode == 200){
        aiSoundResult.hasError=false;
        var responseData = await response.stream.bytesToString();
        aiSoundResult.aiSoundModel = AiSoundModel.fromJson(jsonDecode(responseData));

        print('Sound Result : ${aiSoundResult.aiSoundModel!.result![0]}');
        print('if state response : ${response.statusCode}');
      }

      else {
        aiSoundResult.hasError=true;
        aiSoundResult.ErrorMessage =' else Error ';
        print('else state response : ${response.reasonPhrase}');
      }

      return aiSoundResult;

    }catch(e){
      aiSoundResult.hasError=false ;
      aiSoundResult.ErrorMessage = 'CatchError :$e';
      return aiSoundResult;
    }








    // try{
    //
    //   final request = await http.MultipartRequest('POST',_Uri);
    //   request.files.add(await http.MultipartFile.fromPath('file',audioFile.path));
    //
    //   http.StreamedResponse response = await request.send();
    //
    //   if(response.statusCode == 200){
    //     print( await response.stream.bytesToString());
    //   }
    //   else {
    //     print (response.reasonPhrase);
    //   }
    // }
    // catch(e){
    //   print('catch error : ${e}');
    // }

  }
}

// PostMan http-Dart Code

// var request = http.MultipartRequest('POST', Uri.parse('http://54.86.189.155:8000/predict?label=خوخ'));
// request.files.add(await http.MultipartFile.fromPath('file', '/C:/Users/Dell/Downloads/خَوْخٌ.m4a'));
//
// http.StreamedResponse response = await request.send();
//
// if (response.statusCode == 200) async {
// print(await response.stream.bytesToString());
// }
// else {
// print(response.reasonPhrase);
// }