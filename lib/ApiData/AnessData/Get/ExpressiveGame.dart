import 'dart:convert';
import 'dart:io';
import 'package:autism_app/ApiData/Models/ExpressiveModel.dart';
import 'package:autism_app/ApiData/Models/ReceptiveModel.dart';
import 'package:http/http.dart'as http;
import '../../../Core/constant.dart';
import '../../../main.dart';

class ApiExpressiveResult{
  bool? hasError ;
  String? errorMessage;
  ExpressiveModel? data;
  bool? levelComplete;
  String responseData='nothing loaded';
}

class ApiServesesExpressiveGame {
  //String _accessToken ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg3MDgyMDEyLCJqdGkiOiI0ZDM5MjUyYzkzNmY0YTMwYjI4ZGExNjJlODhhN2U1NiIsInVzZXJfaWQiOjIxfQ.qg3WIfOagA3fAGdfUgJ6oOYgWmg0VIj8TaYVMNfHpyM';
  Future <ApiExpressiveResult> getExpressiveData ({required int level}) async {
    final _Uri = Uri.parse('http://$PublicIP/api/levels/${level}/expressive/');
    ApiExpressiveResult apiExpressiveResult = ApiExpressiveResult();
    try{
      final response = await http.get( _Uri,headers: {
        'Authorization': 'JWT $GlobalAccessToken'
      });
      if(response.statusCode == 200){
        apiExpressiveResult.hasError = false;
        ExpressiveModel result = ExpressiveModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        apiExpressiveResult.data = result;
        apiExpressiveResult.responseData = response.body;
        print('Api return : ${response.body}');
      }
      else {
        apiExpressiveResult.hasError = true ;
        apiExpressiveResult.responseData = response.body;
        apiExpressiveResult.errorMessage = 'Response body Error : ${response.statusCode}';
        print('else error : the response has error in code ${response.statusCode}');
      }
      return apiExpressiveResult;

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