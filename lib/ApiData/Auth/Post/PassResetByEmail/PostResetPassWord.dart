import 'package:http/http.dart'as http;

class PostRestPassWord {
  Future<void> PostData() async {
    final _Url ="http://54.86.189.155/auth/users/reset_password/";
    try{
      final _Uri = Uri.parse(_Url);
      final response = await http.post(_Uri,body: {
        "username": "beso.beso2468@gmail.com",
        "email" : "basssiony17"
      });
      print(response.body);
    }catch(e){
      print('Print Error: ${e}');
      throw Exception('Throw Error : ${e}');
    }
  }
}