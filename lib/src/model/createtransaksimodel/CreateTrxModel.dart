// To parse this JSON data, do
//
//     final registerResModel = registerResModelFromMap(jsonString);

import 'dart:convert';

class CreateTrxModel {
  CreateTrxModel({
    this.success,
  });

  String? success;

  factory CreateTrxModel.fromJson(String str) =>
      CreateTrxModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateTrxModel.fromMap(Map<String, dynamic> json) => CreateTrxModel(
        success: json["success"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
      };
}
