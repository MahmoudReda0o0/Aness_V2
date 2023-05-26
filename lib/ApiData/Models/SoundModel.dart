import "package:flutter/material.dart";

class SoundModel {
  var ladel;
  var sound;

  SoundModel({this.ladel, this.sound});

  SoundModel.FromJson(Map<String, dynamic> json) {
    ladel = json['ladel'];
    sound = json['sound'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sound'] = this.sound;
    data['ladel'] = this.ladel;
    return data;
  }
}
