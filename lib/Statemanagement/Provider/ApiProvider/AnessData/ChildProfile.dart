import 'package:autism_app/ApiData/AnessData/Get/ChildProfileApi.dart';
import 'package:flutter/material.dart';


class ProviderChildProfile extends ChangeNotifier{
  bool catchError = false;
  ChildProfileResult? childProfileResult  ;
  ChildProfileApi _childProfileApi = ChildProfileApi();
  bool? dataLoaded;
   GetChildProfileData () async {
    print('before sent Get ChildData request');
    try{
      childProfileResult = await _childProfileApi.GetChildProfileData();
      notifyListeners();
      if(childProfileResult!.hasError == false){
        print('Provider ChildProfile Get Data');
        // return 'Child FristName : ${childProfileResult.childProfileModel!.userInfo!.firstName}';
        dataLoaded = true;
        notifyListeners();
      }
      else{
        print('Provider ChildProfile has Error :${childProfileResult!.errorMessage}');
        dataLoaded = false;
        notifyListeners();
      }
    }catch(e){
      print('Provider ChildProfile CatchError : $e');
      childProfileResult!.errorMessage = 'Provider ChildProfile CatchError : $e';
      catchError=true;
      notifyListeners();
    }
  }
}