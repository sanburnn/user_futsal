import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/model/loginmodel/LoginReqModel.dart';
import 'package:user_futsal/src/model/loginmodel/LoginResModel.dart';

class ApiService extends GetConnect {
  //*==========Login==============
  Future<LoginResModel?> loginApp(String username, String passwords) async {
    var url = Uri.parse('$BASE_URL/loginuser');
    dynamic body = ({"username": username, "passwords": passwords});
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
        },
        body: jsonEncode(body));
    print(response.body);
    // print(model.toJson());
    print(body);
    if (response.statusCode == 200) {
      return LoginResModel.fromJson(response.body);
    } else {
      // print('Salah');
      return null;
    }
  }
}
