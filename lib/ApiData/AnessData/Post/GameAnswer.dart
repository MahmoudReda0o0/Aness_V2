import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../Statemanagement/Provider/ApiProvider/Auth/ProviderLoginToken.dart';
import '../../../Core/constant.dart';
import '../../../main.dart';

class GameAnswer {
  String GameOne='receptive';
  String GameTwo='receptive';
  String GameThree='social';
  bool LevelComplete =false;

  Future<dynamic> PostGameAnswer({required String GameType,required int LevelNumber}) async {
    String _accessToken ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg3MDgyMDEyLCJqdGkiOiI0ZDM5MjUyYzkzNmY0YTMwYjI4ZGExNjJlODhhN2U1NiIsInVzZXJfaWQiOjIxfQ.qg3WIfOagA3fAGdfUgJ6oOYgWmg0VIj8TaYVMNfHpyM';
    Uri _Uri = Uri.parse('http://$PublicIP/api/levels/$LevelNumber/$GameType/');
    try {
      final response = await http.post(
        _Uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'JWT $GlobalAccessToken'
        },
        body:jsonEncode({
          'answer': 'k',
          'score': 100 ,
        })
      );
      if (response.statusCode == 200) {
        LevelComplete = true;
        print('response StatusCode : ${response.statusCode}');
        print('response body : ${response.body}');
      } else {
        LevelComplete = false;
        print('else response :${response.statusCode}');
        print('else response body : ${response.body}');
      }
    } catch (e) {
      print('catch GameAnswer error : ${e}');
    }
  }
}
