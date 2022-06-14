import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/model/checkusermodel/CheckUserModel.dart';
import 'package:user_futsal/src/model/fasilitasmodel/FasilitasModel.dart';
import 'package:user_futsal/src/model/futsalmodel/FutsalModel.dart';
import 'package:user_futsal/src/model/loginmodel/LoginReqModel.dart';
import 'package:user_futsal/src/model/loginmodel/LoginResModel.dart';
import 'package:user_futsal/src/model/pertandinganmodel/PertandinganModel.dart';
import 'package:user_futsal/src/prefs/prefrences.dart';

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

  Future<UserModel?> cekUser() async {
    final token = await getToken();
    var url = Uri.parse('$BASE_URL/cekuser');
    final response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    print(response.body);
    if (response.statusCode == 200) {
      var produk = cekuserFromJson(response.body);
      return produk.data;
    } else {
      return null;
    }
  }

  Future<List<Futsal>?> getFutsal() async {
    var url = Uri.parse('$BASE_URL/lapanganfutsal');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var produk = futsalFromJson(response.body);
      return produk.data;
    } else {
      return null;
    }
  }

  Future<List<Fasilitas>?> getFasilitas(int id) async {
    var url = Uri.parse('$BASE_URL/getfasilitasuser/$id');
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var produk = fasilitasFromJson(response.body);
      return produk.data;
    } else {
      return null;
    }
  }

  Future<List<Pertandingan>?> getPertandingan(int id) async {
    var url = Uri.parse('$BASE_URL/getjadwaluser/$id');
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var produk = pertandinganFromJson(response.body);
      return produk.data;
    } else {
      return null;
    }
  }
}
