// To parse this JSON data, do
//
//     final registerResModel = registerResModelFromMap(jsonString);

import 'dart:convert';

class RegisterResModel {
  RegisterResModel({
    this.success,
  });

  String? success;

  factory RegisterResModel.fromJson(String str) =>
      RegisterResModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResModel.fromMap(Map<String, dynamic> json) =>
      RegisterResModel(
        success: json["success"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
      };
}
