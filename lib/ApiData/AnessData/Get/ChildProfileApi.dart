import 'dart:convert';

import 'package:autism_app/ApiData/Models/ChildProfileModel.dart';
import 'package:autism_app/main.dart';
import '../../../Core/constant.dart';
import 'package:http/http.dart' as http;

import '../../../Core/constant.dart';


class ChildProfileResult{
  bool? hasError;
  ChildProfileModel? childProfileModel;
  String? errorMessage='no Error';
}

class ChildProfileApi {

  Future<ChildProfileResult> GetChildProfileData () async {
    ChildProfileResult childProfileResult = ChildProfileResult();
   // ChildProfileModel childProfileModel = ChildProfileModel();
    Uri _Uri = Uri.parse('http://$PublicIP/api/children/me/');
    try {
      final response = await http.get( _Uri,headers: {
        'Authorization': 'JWT $GlobalAccessToken'
      });
      print('respinse cose : ${response.statusCode}');
      if(response!= null){
        print('Api childProfile response : ${response.body}');
      }else{
        print('Api childProfile response: Empty');
      }
      if(response.statusCode == 200){
        childProfileResult.hasError=false;
        print('Api ChildProfile response : ${response.statusCode}');
        print('Api ChildProfile body : ${response.body}');
        //childProfileResult.childProfileModel= ChildProfileModel.fromJson(jsonDecode('{"picture":null,"current_level":5,"join_duration_in_days":27,"accuracy":{"receptive":100.0,"expressive":100.0,"social":100.0},"words":"/api/children/me/words","user_info":{"id":21,"email":"autismaness2000@gmail.com","username":"aneestest5520","first_name":"ksdbcsdc","last_name":"siudhcisudhc","date_of_birth":"2000-01-01","gender":"M"}}'));
        childProfileResult.childProfileModel= ChildProfileModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        print('Api ChildProfile name : ${childProfileResult.childProfileModel!.userInfo!.username}');
        return childProfileResult;
      }else{
        childProfileResult.hasError=true;
        childProfileResult.errorMessage='Api Child Profile Error : ${response.body}';
        return childProfileResult;
      }
    }catch(e){
      childProfileResult.errorMessage='Api ChildProfile Catch Error : $e';
      return childProfileResult;
    }
    }

}