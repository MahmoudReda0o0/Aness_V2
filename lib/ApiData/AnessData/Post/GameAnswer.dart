import 'dart:convert';

import 'package:http/http.dart' as http;

class GameAnswer {
  Future<dynamic> PostGameAnswer() async {
    Uri _Uri = Uri.parse('http://54.86.189.155/api/levels/1/receptive/');

    try {
      final response = await http.post(
        _Uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2Mzk5NTY0LCJqdGkiOiJlNDQ3MDFhNmM2ZDc0MDA4OTNlYWViY2Q5MzQ1ODg1MyIsInVzZXJfaWQiOjIxfQ.vHs6qLncb57D4sG37T_M4Uehv4IKuhJtwfaLyZ7OYk0'
        },
        body:jsonEncode({
          'answer': 'k',
          'score': 100
        })


      );
      if (response.statusCode == 200) {
        print('response StatusCode : ${response.statusCode}');
        print('response body : ${response.body}');
      } else {
        print('else response :${response.statusCode}');
        print('else response body : ${response.body}');
      }
    } catch (e) {
      print('catch error : ${e}');
    }
  }
}
