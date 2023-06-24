import 'package:http/http.dart'as http;
import '../../../../Core/constant.dart';
import '../../../../main.dart';

class PostPassRestConfirm {
  Future<void> PostData() async {
    final _Url ="http://$PublicIP/auth/users/reset_password_confirm/";
    try{
      final _Uri = Uri.parse(_Url);
      final response = await http.post(_Uri,body: {
        "uid" : "MTA" ,
        "token": "bkh898-fd29833bd3403927e1fdd3e476c57e27" ,
        "new_password" : "backendishell" ,
        "re_new_password": "backendishell"
      });
      print(response.body);
    }catch(e){
      print('Print Error: ${e}');
      throw Exception('Throw Error : ${e}');
    }
  }
}