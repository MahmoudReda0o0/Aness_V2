import 'package:http/http.dart'as http;
import '../../../../Core/constant.dart';
import '../../../../main.dart';

class UpdateAllData {
  Future<void> PutData ()async{
    final _Url="http://$PublicIP/auth/users/me/";
    final _Uri=Uri.parse(_Url);
    final response = await http.put(_Uri);
  }
}