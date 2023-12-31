import 'dart:convert';
import 'dart:io';

import 'package:autism_app/ApiData/Models/ReceptiveModel.dart';
import '../../../Core/constant.dart';
import 'package:http/http.dart'as http;


import '../../../main.dart';

class ApiReceptiveResult{
  bool? hasError ;
  String? errorMessage;
  ReceptiveModel? data;
  bool? levelComplete;
  String responseData='nothing Loaded';
}

class ApiServesesReceptiveGame {
   Future <ApiReceptiveResult> getReceptiveData ({required int level}) async {
    final _Uri = Uri.parse('http://$PublicIP/api/levels/${level}/receptive/');
    ApiReceptiveResult apiReceptiveResult = ApiReceptiveResult();
    try{
      final response = await http.get( _Uri,headers: {
        'Authorization': 'JWT $GlobalAccessToken'
      });
      if(response.statusCode == 200){
        apiReceptiveResult.hasError = false;
        apiReceptiveResult.responseData = response.body;
        ReceptiveModel result = ReceptiveModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        apiReceptiveResult.data = result;
        print('Api Receptive return : ${response.body}');
      }
      else {
        apiReceptiveResult.hasError = true ;
        apiReceptiveResult.responseData = response.body;
        apiReceptiveResult.errorMessage = 'Response body Error : ${response.statusCode}';
        print('else error : the response has error in code ${response.statusCode}');
        }
      return apiReceptiveResult;

    }catch(e) {
      throw Exception('Api catch error : ${e}');
    }
  }
}

// class GetReceptiveTest {
//   Future <ReceptiveModel> GetAlbumData () async {
//     String accessToken = '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlb
//     l90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2MjI0MTU4LCJqdGkiOiJmN2UxZDgyMWM5MWQ
//     0NmU2YThjZGZiNTcyYmJiYTVhZCIsInVzZXJfaWQiOjIxfQ.MrIo3L0rmAS6Zb7g2u1-r5l
//     uock0FLo2bMSvbe5bK0M''';
//     Uri _Uri = Uri.parse('http://54.86.189.155/api/levels/1/receptive/');
//     try{
//       final response = await http.get(_Uri,headers: {
//         'Authorization': 'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2MjI0MTU4LCJqdGkiOiJmN2UxZDgyMWM5MWQ0NmU2YThjZGZiNTcyYmJiYTVhZCIsInVzZXJfaWQiOjIxfQ.MrIo3L0rmAS6Zb7g2u1-r5luock0FLo2bMSvbe5bK0M'});
//       if(response.statusCode == 200){
//         ReceptiveModel result = ReceptiveModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
//         print('response body : ${response.body}');
//         return result ;
//       }
//       else {
//         print('response error : ${response.statusCode}');
//         return throw Exception('else error : ${response.body}');
//       }
//     }catch (e){
//       print('Catch error :${ e}');
//       return throw Exception('Catch error :${ e}');
//     }
//   }
// }