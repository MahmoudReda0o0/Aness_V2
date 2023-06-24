import 'dart:convert';
import 'dart:io';

import 'package:autism_app/ApiData/Models/ModelAccountRegister.dart';
import 'package:http/http.dart' as http;

import '../../../../Core/constant.dart';
import '../../../../main.dart';

class AccountRegisterResult{
  bool? hasError;
  String? errorMessage;
  ModelAccountRegister? modelAccountRegister;
}



class ApiAccountRegister {
  Future<AccountRegisterResult> PostData({
    required String fristname,
    required String lastname,
    required String username,
    required String email,
    required String password,
    required String re_password,
    required String gender,
  }) async {
    final _Url = "http://$PublicIP/auth/users/";
    final _Uri = Uri.parse(_Url);
    AccountRegisterResult accountRegisterResult = AccountRegisterResult();
    try {
      final response = await http.post(_Uri,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({
            "first_name": fristname,
            "last_name": lastname,
            "username": username,
            "gender": gender,
            "date_of_birth": "2000-01-01",
            "email": email,
            "password": password,
            "re_password": re_password,
          }));
      print(response.body);
      if (response.statusCode == 201) {
        final result = ModelAccountRegister.fromJson(jsonDecode(response.body));
        accountRegisterResult.modelAccountRegister =result;
        accountRegisterResult.hasError =false;
        print(response.body);
      } else {
        accountRegisterResult.hasError = true;
        accountRegisterResult.errorMessage ='Account Register Response !=201';
      }
      return accountRegisterResult;
    } catch (e) {
      throw Exception('error : ${e}');
    }
  }
}
