import 'package:http/http.dart'as http;

class GetUserData{
  Future<void> GetData() async{
    final _Url="http://54.86.189.155/auth/users/me";
    final _Uri=Uri.parse(_Url);
    final response = await http.get(_Uri);
    if(response.statusCode==200){
      final result = response.body;
    }

  }
}