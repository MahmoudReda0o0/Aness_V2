import 'package:http/http.dart'as http;
import '../../../../Core/constant.dart';
import '../../../../main.dart';

class PostRefreshLoginToken {
  Future<void> PostData() async {
    final _Url ="http://$PublicIP/auth/jwt/refresh/";
    try{
      final _Uri = Uri.parse(_Url);
      final response = await http.post(_Uri,body: {
        "refresh": GlobalAccessToken},);
      print(response.body);
    }catch(e){
      print('Print Error: ${e}');
      throw Exception('Throw Error : ${e}');
    }
  }
}