import 'package:autism_app/ApiData/Models/ModelLoginToken.dart';
import 'package:autism_app/Features/Widgets/LoadingDialog.dart';
import '../../../../Features/Presentation_Screens/App_Start_Page/UI/View/StartPage.dart';
import '../../../../main.dart';
import 'package:flutter/material.dart';
import '../../../../ApiData/Auth/Post/LoginToken/ApiLoginToken.dart';

enum LoginTokenState {initial , loading , loaded , error, pop}

class ProviderLoginToken extends ChangeNotifier {
  LoginTokenState state = LoginTokenState.initial;
  LoginModel loginModel = LoginModel();
  ApiLoginToken apiloginToken = ApiLoginToken();
  LoginApiResult loginApiResult = LoginApiResult();

  bool Sharedloaded =false;
  String ErrorMessage ='';
  bool showErrorMessage =false;

  // String accessToken ='';
  // String refreshToken ='';

  // void getAccessToken({required acessToken}){
  //   accessToken = accessToken;
  //   notifyListeners();
  // }

  void initalLoginPage (){
    state = LoginTokenState.initial;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
    BuildContext? context ,
  }) async {
    try{
      state = LoginTokenState.loading;
      notifyListeners();
      print('before request login State : $state');
      loginApiResult = await apiloginToken.LoginPostData(Email: email,Password: password);
      print('after request login State : $state');

      if(loginApiResult.hasError==false){
        loginModel = loginApiResult.data!;
        GlobalAccessToken =loginModel.access!;
        showErrorMessage= false;
        Sharedloaded =true;
        state = LoginTokenState.loaded;
        Navigator.pushReplacement(navigationKey.currentContext!, MaterialPageRoute(builder: (context)=>StartPage()));
        print('GlobalAccessToken : $GlobalAccessToken');
        notifyListeners();
      }
      else{
        ErrorMessage = loginApiResult.errorMessage!;
        state = LoginTokenState.error;
        print('has Error = true');
        showErrorMessage =true;
        Sharedloaded = false;
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
