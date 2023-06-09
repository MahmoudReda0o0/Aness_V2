class ReceptiveModel {
  int? id;
  String? answer;
  List<Images>? images;

  ReceptiveModel({this.id, this.answer, this.images});

  ReceptiveModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? img;
  String? name;

  Images({this.id, this.img, this.name});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['name'] = this.name;
    return data;
  }
}