import 'dart:convert';
import 'dart:io';
import 'package:autism_app/ApiData/Models/ModelLoginToken.dart';
import 'package:autism_app/Features/Presentation_Screens/Login/UI/View/Login.dart';
import 'package:http/http.dart' as http;
import '../../../../Core/constant.dart';
import '../../../../main.dart';


class LoginApiResult{
  bool? hasError;
  String? errorMessage;
  LoginModel? data;
}


class ApiLoginToken {
  Future<LoginApiResult> LoginPostData(
      {required String Email, required String Password}) async {
    final _Url = "http://$PublicIP/auth/jwt/create/";
    final _Uri = Uri.parse(_Url);
    print('Api login request before try catch');
    LoginApiResult loginApiResult = LoginApiResult();
    try {
      print('Api login request before http post');
      final response = await http.post(
        _Uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(
          {
            "email": Email,
            "password": Password,
            "username":Email
          },
        ),
      );
      print('Api login request before if state');
      if (response.statusCode == 200) {
        loginApiResult.hasError = false;
        final result = LoginModel.fromJson(jsonDecode(response.body));
        print(response.body);
        loginApiResult.data =result;
      } else {
        loginApiResult.hasError = true ;
        print('else error response status :${response.statusCode}');
        print('else error response body :${response.body}');
        loginApiResult.errorMessage ='response body has error';
      }
      return loginApiResult ;
    } catch (e) {
      print('Print Error: ${e}');
      throw Exception('Throw Error : ${e}');
    }
  }
}
