import 'package:autism_app/ApiData/Auth/Post/AccountRegister/ApiAccountRegister.dart';
import 'package:autism_app/ApiData/Models/ModelAccountRegister.dart';
import 'package:flutter/material.dart';

enum AccountRegisterState { initial, loading, loaded, error }

class ProviderAccountRegister extends ChangeNotifier {
  AccountRegisterState state = AccountRegisterState.initial;
  ApiAccountRegister apiAccountRegister = ApiAccountRegister();
  AccountRegisterResult accountRegisterResult = AccountRegisterResult();
  ModelAccountRegister modelAccountRegister = ModelAccountRegister();

  String errorMessage = '';
  bool showErrorMessage = false;

  String Fristname = '';
  String Lastname = '';
  String Username = '';
  String Email = '';
  String Password = '';
  String Re_Password = '';
  String Gender='';

  bool getemailpasserror =false;
  void GetEmail_Password({
    required String email,
    required String password,
    required String re_password,
  }) {
    Email = email;
    Password = password;
    Re_Password = re_password;
    if(Email ==''|| Password == '' || Re_Password == ''){
      getemailpasserror = true;
      notifyListeners();
    }
    else{
      getemailpasserror =false;
      notifyListeners();
    }
    print('''
    Email :${Email}
    Password : ${Password}
    re_Password : ${Re_Password}
    ''');
    notifyListeners();
  }

  bool getusernameerror =false ;
  void GetUserName({
    required String fristname,
    required String lastname,
    required String username,
    required String gender,
  }) {
    Fristname = fristname;
    Lastname = lastname;
    Username = username;
    Gender = gender;
    print('''
    fristname: ${Fristname}
    lastname:  ${Lastname}
    Username : ${Username}
    Gender =$Gender
    ''');
    if(Fristname ==''|| Lastname==''){
      getusernameerror =true ;
      notifyListeners();
    }
    else{
      getusernameerror = false ;
      notifyListeners();
    }
  }

  bool postdataDone =false ;
  Future PostData() async {
    try {
      state = AccountRegisterState.loading;
      notifyListeners();
      accountRegisterResult = await apiAccountRegister.PostData(
        fristname: Fristname,
        lastname: Lastname,
        username: Username,
        email: Email,
        password: Password,
        re_password: Re_Password,
        gender: Gender,
      );
      if (!accountRegisterResult.hasError!) {
        modelAccountRegister = accountRegisterResult.modelAccountRegister!;
        state = AccountRegisterState.loaded;
        print('Provider Account Register hasError = false');
        showErrorMessage = false;
        postdataDone = true ;
        print('postdataDone : ${postdataDone}');
        notifyListeners();
      } else {
        errorMessage = accountRegisterResult.errorMessage!;
        state = AccountRegisterState.error;
        showErrorMessage = true;
        postdataDone = false ;
        print('Provider Account Register hasError = true');
        print('postdataDone : ${postdataDone}');
        notifyListeners();
      }
    } catch (e) {
      print('Catch Error : ${e}');
    }
  }
}
