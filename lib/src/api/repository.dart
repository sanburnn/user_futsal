import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:user_futsal/src/config/env.dart';
import 'package:user_futsal/src/model/checkusermodel/CheckUserModel.dart';
import 'package:user_futsal/src/model/createtransaksimodel/CreateTrxModel.dart';
import 'package:user_futsal/src/model/fasilitasmodel/FasilitasModel.dart';
import 'package:user_futsal/src/model/futsalmodel/FutsalModel.dart';
import 'package:user_futsal/src/model/harimodel/HariModel.dart';
import 'package:user_futsal/src/model/jammodel/JamModel.dart';
import 'package:user_futsal/src/model/loginmodel/LoginResModel.dart';
import 'package:user_futsal/src/model/pertandinganmodel/PertandinganModel.dart';
import 'package:user_futsal/src/model/registermodel/RegisterResModel.dart';
import 'package:user_futsal/src/model/transaksimodel/TransaksiModel.dart';
import 'package:user_futsal/src/model/uploadbuktimodel/UploadModel.dart';
import 'package:user_futsal/src/prefs/prefrences.dart';
import 'package:user_futsal/src/router/constant.dart';

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

  Future<RegisterResModel?> register(
      String nama, String notelp, String username, String passwords) async {
    var url = Uri.parse('$BASE_URL/daftaruser');
    dynamic body = ({
      "nama": nama,
      "notelp": notelp,
      "username": username,
      "passwords": passwords
    });
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
        },
        body: jsonEncode(body));
    print(response.body);

    if (response.statusCode == 200) {
      return RegisterResModel.fromJson(response.body);
    } else {
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

  Future<List<Transaksi>?> getTransaksi(String id) async {
    var url = Uri.parse('$BASE_URL/transaksiuser/$id');
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var produk = transaksiFromJson(response.body);
      return produk.data;
    } else {
      return null;
    }
  }

  Future<CreateTrxModel?> createTransaksi(
      String idfutsal,
      String idpengguna,
      String nama,
      String notelp,
      String tanggal,
      String jam,
      String status) async {
    var url = Uri.parse('$BASE_URL/createtransaksi');
    dynamic body = ({
      "idfutsal": idfutsal,
      "idpengguna": idpengguna,
      "nama": nama,
      "notelp": notelp,
      "tanggal": tanggal,
      "jam": jam,
      "satatus": status
    });
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
        },
        body: jsonEncode(body));
    print(response.body);

    if (response.statusCode == 200) {
      return CreateTrxModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Hari>?> getHari(int id) async {
    var url = Uri.parse('$BASE_URL/gethariuser/$id');
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var produk = hariFromJson(response.body);
      return produk.data;
    } else {
      return null;
    }
  }

  Future<List<Jam>?> getJam(String idfutsal, String idhari) async {
    var url = Uri.parse('$BASE_URL/getjamuser');
    dynamic body = ({"idfutsaljadwal": idfutsal, "idhari": idhari});
    final response = await http.post(url, body: jsonEncode(body));
    print(body);
    print(response.body);
    if (response.statusCode == 200) {
      var produk = jamFromJson(response.body);
      return produk.data;
    } else {
      return null;
    }
  }

  Future<UploadModel?> uploadBukti(filepath, String id) async {
    var url = Uri.parse('$BASE_URL/uploadbukti/$id');

    http.MultipartRequest request = new http.MultipartRequest("POST", url);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('sendimage', filepath);

    request.files.add(multipartFile);

    http.StreamedResponse response = await request.send();

    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Image uploaded successfully',
          margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      Get.offAllNamed(mainNavigationRoute);
    } else {
      return null;
    }
    return null;
  }
}
