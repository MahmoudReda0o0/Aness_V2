import 'package:autism_app/ApiData/AnessData/Get/ChildProfileApi.dart';
import 'package:flutter/material.dart';


class ProviderChildProfile extends ChangeNotifier{
  ChildProfileResult childProfileResult = ChildProfileResult();
  ChildProfileApi childProfileApi = ChildProfileApi();
  Future <ChildProfileResult>GetChildProfileData () async {
    print('before sent Get ChildData request');
    try{
      childProfileResult = await childProfileApi.GetChildProfileData();
      notifyListeners();
      if(childProfileResult.hasError == false){
        print('Provider ChildProfile Get Data');
        // return 'Child FristName : ${childProfileResult.childProfileModel!.userInfo!.firstName}';
        return childProfileResult;
      }
      else{
        print('Provider ChildProfile has Error :${childProfileResult.errorMessage}');
        return childProfileResult;
      }
    }catch(e){
      print('Provider ChildProfile CatchError : $e');
      return childProfileResult;
    }
  }
}