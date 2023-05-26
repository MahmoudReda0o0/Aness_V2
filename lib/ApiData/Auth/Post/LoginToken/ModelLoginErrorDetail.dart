class ModelLoginErrorDetail {
  String? detail;

  ModelLoginErrorDetail({this.detail});

  ModelLoginErrorDetail.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    return data;
  }
}