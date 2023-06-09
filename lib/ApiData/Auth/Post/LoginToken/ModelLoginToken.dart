class LoginModel {
  String? refresh;
  String? access;
  String errordetail="من فضلك أعد إدخال البيانات صحيحة";

  LoginModel({this.refresh, this.access});

  LoginModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    //detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    //data['detail'] = this.detail;
    return data;
  }
}
// class GetReceptiveTest {
//   Future Receptive () async {
//     var headers = {
//       'Authorization': 'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2MTE2MjI5LCJqdGkiOiI3Mjg0NWZhOGI1MjA0MWRjYjg5OGFlY2E2OGUwZDUzMCIsInVzZXJfaWQiOjIxfQ.dJdDVKizOhKKAUW4lT-P0cj3vtHCW6P5znpbIcBu9l0'
//     };
//     var request = http.Request('GET', Uri.parse('http://54.86.189.155/api/levels/1/receptive/'));
//
//     request.headers.addAll(headers);
//
//     final response = await request.send();
//
//     if (response.statusCode == 200) {
//       print('done : ${response.statusCode} & ${await response.stream.bytesToString()}');
//     }
//     else {
//       print('else error not done : ${response.statusCode}');
//     }
//   }
// }