class ExpressiveModel {
  int? id;
  String? img;
  String? answer;

  ExpressiveModel({this.id, this.img, this.answer});

  ExpressiveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['answer'] = this.answer;
    return data;
  }
}