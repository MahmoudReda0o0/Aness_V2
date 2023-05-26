import 'package:http/http.dart'as http;

class UpdateAllData {
  Future<void> PutData ()async{
    final _Url="http://54.86.189.155/auth/users/me/";
    final _Uri=Uri.parse(_Url);
    final response = await http.put(_Uri);
  }
}