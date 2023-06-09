import 'dart:convert';
import 'dart:io';
import 'package:autism_app/ApiData/Auth/Post/LoginToken/ModelLoginToken.dart';
import 'package:autism_app/Features/Presentation_Screens/Login/UI/View/Login.dart';
import 'package:http/http.dart' as http;
import 'ModelLoginErrorDetail.dart';

class LoginApiResult{
  bool? hasError;
  String? errorMessage;
  LoginModel? data;
}


class ApiLoginToken {
  Future<LoginApiResult> LoginPostData(
      {required String Email, required String Password}) async {
    final _Url = "http://54.86.189.155/auth/jwt/create/";
    final _Uri = Uri.parse(_Url);
    LoginApiResult loginApiResult = LoginApiResult();
    try {
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
        loginApiResult.hasError = false ;
        final result = LoginModel.fromJson(jsonDecode(response.body));
        print(response.body);
        loginApiResult.data =result;
      } else {
        loginApiResult.hasError = true ;
        print('else error response status != 200');
        loginApiResult.errorMessage ='response body has error';
      }
      return loginApiResult ;
    } catch (e) {
      print('Print Error: ${e}');
      throw Exception('Throw Error : ${e}');
    }
  }
}
