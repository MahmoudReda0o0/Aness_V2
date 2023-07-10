import 'dart:convert';

import 'package:autism_app/ApiData/Models/SocialModel.dart';
import 'package:autism_app/main.dart';
import 'package:http/http.dart' as http;

class ApiResultSocial {
  bool? hasError;
  String? Message;
  SocialModel? socialModel;
  bool? gameComplete=false;
  
}

class ApiServisesSocialGame {
  Future<ApiResultSocial> GetSocialGame({required int level}) async {
    ApiResultSocial apiResultSocial =ApiResultSocial();
    
    Uri _uri = Uri.parse('http://100.26.161.6/api/levels/$level/social');
    try{
      final response = await http.get(_uri,
      headers: {
        'Authorization': 'JWT $GlobalAccessToken'
      });
      if(response.statusCode == 200){
        apiResultSocial.hasError = false;
        apiResultSocial.Message='SOCIAL errorMessage > Data Loaded response body :${response.body}';
        apiResultSocial.socialModel = SocialModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        apiResultSocial.Message ='Social if Api : Data Loaded > response body ${response.body}';
        print('frist message : ${apiResultSocial.socialModel!.messages![1].message}');
      }
      else{
        apiResultSocial.hasError=true;
        apiResultSocial.Message = 'SOCIAL elseError api > response: ${response.statusCode} , response body ${response.body}';
      }
      return apiResultSocial;
    }catch(e){
      print('Social catch error : ${e}');
      apiResultSocial.hasError =true;
      apiResultSocial.Message = 'Social catchError api ${e}';
      return apiResultSocial;
    }
}
}