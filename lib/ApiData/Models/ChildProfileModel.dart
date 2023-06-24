class ChildProfileModel {
  String? picture;
  int? currentLevel;
  int? joinDurationInDays;
  Accuracy? accuracy;
  String? words;
  UserInfo? userInfo;

  ChildProfileModel(
      {this.picture,
      this.currentLevel,
      this.joinDurationInDays,
      this.accuracy,
      this.words,
      this.userInfo});

  ChildProfileModel.selfromJson(Map<String, dynamic> json) {

    accuracy = json['accuracy'] != null
        ? new Accuracy.fromJson(json['accuracy'])
        : null;

  }

  ChildProfileModel.fromJson(Map<String, dynamic> json) {
    picture != null ? json['picture'] : 'null pic value';
    currentLevel = json['current_level'];
    joinDurationInDays = json['join_duration_in_days'];
    accuracy = json['accuracy'] != null
        ? new Accuracy.fromJson(json['accuracy'])
        : null;
    words = json['words'];
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picture'] = this.picture;
    data['current_level'] = this.currentLevel;
    data['join_duration_in_days'] = this.joinDurationInDays;
    if (this.accuracy != null) {
      data['accuracy'] = this.accuracy!.toJson();
    }
    data['words'] = this.words;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class Accuracy {
  double? receptive;
  double? expressive;
  double? social;

  Accuracy({this.receptive, this.expressive, this.social});

  Accuracy.fromJson(Map<String, dynamic> json) {
    if(json['receptive']==0){
      receptive = 0.0;
      print('[receptive] : $receptive');
    }else{
      receptive = json['receptive'];
      print('[receptive] : $receptive');
    }
    if(json['expressive']==0){
      expressive = 0.0;
      print('[expressive] : $expressive');
    }else{
      expressive = json['expressive'];
    }
    if(json['social']==0){
      print('json[receptive] : ${json['social']}');
      receptive = 10.0;
      print('[social] : $social');
    }else{
      social = json['social'];
    }
    // receptive = json['receptive'];
    //expressive = json['expressive'];
    //social = json['social'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receptive'] = this.receptive;
    data['expressive'] = this.expressive;
    data['social'] = this.social;
    return data;
  }
}

class UserInfo {
  int? id;
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;

  UserInfo(
      {this.id,
      this.email,
      this.username,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    return data;
  }
}
