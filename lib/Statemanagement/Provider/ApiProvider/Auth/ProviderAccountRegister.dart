import 'package:autism_app/ApiData/Auth/Post/AccountRegister/ApiAccountRegister.dart';
import 'package:autism_app/ApiData/Auth/Post/AccountRegister/ModelAccountRegister.dart';
import 'package:flutter/material.dart';

class ProviderAccountRegister extends ChangeNotifier {
  ApiAccountRegister _apiAccountRegister = ApiAccountRegister();
  ModelAccountRegister modelAccountRegister = ModelAccountRegister();

  String Fristname='';
  String Lastname='';
  String Email = '';
  String Password = '';
  String Username ='';
  bool isloading = false;

  void GetEmail_Password({
    required String email,
    required String password,
  }) {
    Email = email;
    Password = password;
    print('''
    Email :${Email}
    Password : ${Password}
    ''');
    notifyListeners();
  }
  void GetUserName ({required String fristname,required String lastname,required String username}){
    Fristname = fristname ;
    Lastname = lastname ;
    Username = username;
    print('''
    fristname: ${Fristname}
    lastname:  ${Lastname}
    Username : ${Username}
    ''');
    notifyListeners();
  }
  Future PostData({
    Function? function,
  }) async {
    modelAccountRegister = await _apiAccountRegister.PostData(
      fristname: Fristname,
      lastname: Lastname,
      username: Username,
      email: Email,
      password: Password,
    );
    function!();
    notifyListeners();
  }
}
