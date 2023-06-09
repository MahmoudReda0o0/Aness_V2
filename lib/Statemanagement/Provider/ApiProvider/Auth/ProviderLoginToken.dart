import 'package:autism_app/ApiData/Auth/Post/LoginToken/ModelLoginToken.dart';
import 'package:autism_app/Features/Widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import '../../../../ApiData/Auth/Post/LoginToken/ApiLoginToken.dart';

enum LoginTokenState {initial , loading , loaded , error}

class ProviderLoginToken extends ChangeNotifier {
  LoginTokenState state = LoginTokenState.initial;
  LoginModel loginModel = LoginModel();
  ApiLoginToken apiloginToken = ApiLoginToken();
  LoginApiResult loginApiResult = LoginApiResult();

  String ErrorMessage ='';
  bool showErrorMessage =false;

  String accessToken ='';
  String refreshToken ='';

  Future<void> Login({
    required String email,
    required String password,
    BuildContext? context ,
  }) async {
    try{
      state = LoginTokenState.loading;
      notifyListeners();
      loginApiResult = await apiloginToken.LoginPostData(Email: email,Password: password);


      if(!loginApiResult.hasError!){
        loginModel = loginApiResult.data!;
        state = LoginTokenState.loaded;
        print('has Error = false');
        notifyListeners();
      }
      else{
        ErrorMessage = loginApiResult.errorMessage!;
        state = LoginTokenState.error;
        print('has Error = true');
        showErrorMessage =true;
        notifyListeners();
      }
      //Navigator.pop(context);

    }
    catch(e){
      // Navigator.pop(context!);
      print('Catch Error : ${e}');
      notifyListeners();
    }
  }
}
