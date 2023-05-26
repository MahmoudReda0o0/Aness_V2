import 'dart:convert';
import 'dart:io';

import 'package:autism_app/ApiData/Auth/Post/LoginToken/ModelLoginToken.dart';
import 'package:autism_app/Features/Presentation_Screens/Login/UI/View/Login.dart';
import 'package:http/http.dart' as http;

import 'ModelLoginErrorDetail.dart';

class ApiLoginToken {
  Future<LoginModel> LoginPostData(
      {required String Email, required String Password}) async {
    final _Url = "http://54.86.189.155/auth/jwt/create/";
    try {
      final _Uri = Uri.parse(_Url);
      final response = await http.post(
        _Uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(
          {
            "email": Email,
            "password": Password,
          },
        ),
      );
      if (response.statusCode == 200) {
        final result = LoginModel.fromJson(jsonDecode(response.body));
        print(response.body);
        return result;
      } else {
        LoginModel loginModel = LoginModel();
        print('else error response status=! 200');
        return loginModel ;
      }
    } catch (e) {
      print('Print Error: ${e}');
      throw Exception('Throw Error : ${e}');
    }
  }
}
