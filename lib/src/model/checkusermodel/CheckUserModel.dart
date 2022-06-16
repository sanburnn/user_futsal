import 'dart:convert';

CekUserModel cekuserFromJson(String str) =>
    CekUserModel.fromJson(json.decode(str));

String cekuserToJson(CekUserModel data) => json.encode(data.toJson());

class CekUserModel {
  String? message;
  UserModel? data;

  CekUserModel({this.message, this.data});

  CekUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserModel {
  String? username;
  String? idPengguna;
  String? nama;
  String? notelp;
  int? exp;

  UserModel({this.username, this.idPengguna, this.nama, this.notelp, this.exp});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    idPengguna = json['id_pengguna'];
    nama = json['nama'];
    notelp = json['notelp'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['id_pengguna'] = this.idPengguna;
    data['nama'] = this.nama;
    data['notelp'] = this.notelp;
    data['exp'] = this.exp;
    return data;
  }
}
