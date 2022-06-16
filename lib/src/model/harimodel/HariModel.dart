import 'dart:convert';

JadwalHariModel hariFromJson(String str) =>
    JadwalHariModel.fromJson(json.decode(str));

String hariToJson(JadwalHariModel data) => json.encode(data.toJson());

class JadwalHariModel {
  int? status;
  String? message;
  List<Hari>? data;

  JadwalHariModel({this.status, this.message, this.data});

  JadwalHariModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Hari>[];
      json['data'].forEach((v) {
        data!.add(new Hari.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hari {
  String? idHari;
  String? idfutsalhari;
  String? tanggal;

  Hari({this.idHari, this.idfutsalhari, this.tanggal});

  Hari.fromJson(Map<String, dynamic> json) {
    idHari = json['id_hari'];
    idfutsalhari = json['idfutsalhari'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_hari'] = this.idHari;
    data['idfutsalhari'] = this.idfutsalhari;
    data['tanggal'] = this.tanggal;
    return data;
  }
}
