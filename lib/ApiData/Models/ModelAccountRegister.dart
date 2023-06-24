class ModelAccountRegister {
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? username;
  String? email;
  int? id;

  ModelAccountRegister(
      {this.firstName,
        this.lastName,
        this.dateOfBirth,
        this.gender,
        this.username,
        this.email,
        this.id});

  ModelAccountRegister.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    username = json['username'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['username'] = this.username;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}