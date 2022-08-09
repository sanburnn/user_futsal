// To parse this JSON data, do
//
//     final registerResModel = registerResModelFromMap(jsonString);

import 'dart:convert';

class UpdateJam {
  UpdateJam({
    this.success,
  });

  String? success;

  factory UpdateJam.fromJson(String str) => UpdateJam.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateJam.fromMap(Map<String, dynamic> json) => UpdateJam(
        success: json["success"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
      };
}
