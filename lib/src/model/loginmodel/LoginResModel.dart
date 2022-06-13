// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromMap(jsonString);

import 'dart:convert';

class LoginResModel {
  LoginResModel({
    this.message,
    this.token,
  });

  String? message;
  String? token;

  factory LoginResModel.fromJson(String str) =>
      LoginResModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResModel.fromMap(Map<String, dynamic> json) => LoginResModel(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "token": token,
      };
}
