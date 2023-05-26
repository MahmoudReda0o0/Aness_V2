import 'package:http/http.dart'as http;

class PostRefreshLoginToken {
  Future<void> PostData() async {
    final _Url ="http://localhost:8000/auth/jwt/refresh/";
    try{
      final _Uri = Uri.parse(_Url);
      final response = await http.post(_Uri,body: {
        "refresh": '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90
        eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4NTYwMDMzNCwianRpIjoiZmFmYTdmZjI2
        YWQwNGRmYmEwNjA0Y2ZjZDc0YjdmYzgiLCJ1c2VyX2lkIjoxMH0.7r2z5gOIKYQF
        LRBgDDXdMVl3DKMmZpzYyRA19CwqVwU'''});
      print(response.body);
    }catch(e){
      print('Print Error: ${e}');
      throw Exception('Throw Error : ${e}');
    }
  }
}