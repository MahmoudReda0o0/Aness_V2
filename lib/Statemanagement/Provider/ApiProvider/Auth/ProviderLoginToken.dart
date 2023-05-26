import 'package:autism_app/ApiData/Auth/Post/LoginToken/ModelLoginToken.dart';
import 'package:autism_app/Features/Widgets/LoadingDialog.dart';
import 'package:flutter/material.dart';
import '../../../../ApiData/Auth/Post/LoginToken/ApiLoginToken.dart';
enum LoginTokenState {initial , loading , loaded , error}

class ProviderLoginToken extends ChangeNotifier {
  LoginTokenState state = LoginTokenState.initial;
  LoginModel _loginModel = LoginModel();
  LoginModel get loginmodel =>_loginModel;
  ApiLoginToken apiloginToken = ApiLoginToken();
  bool isloading = false;
  bool iserror =false ;

  String accessToken ='';
  String refreshToken ='';

  Future<void> Login({
    required String email,
    required String password,
    Function? function,
    BuildContext? context ,
  }) async {
    try{
      isloading=true ;
      //showLoaderDialog(context!);
      _loginModel = await apiloginToken.LoginPostData(Email: email, Password: password);
      isloading = false;
      iserror =false ;
      //Navigator.pop(context);
      function!();
      notifyListeners();
    }
    catch(e){
      // Navigator.pop(context!);
      print('Error : ${e}');
      iserror = true ;
      notifyListeners();
    }
  }
}
