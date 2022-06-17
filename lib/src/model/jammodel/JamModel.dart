import 'dart:convert';

JamModel jamFromJson(String str) => JamModel.fromJson(json.decode(str));

String jamToJson(JamModel data) => json.encode(data.toJson());

class JamModel {
  int? status;
  String? message;
  List<Jam>? data;

  JamModel({this.status, this.message, this.data});

  JamModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Jam>[];
      json['data'].forEach((v) {
        data!.add(new Jam.fromJson(v));
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

class Jam {
  String? idjadwal;
  String? idfutsaljadwal;
  String? idhari;
  String? jam;
  String? satatus;

  Jam(
      {this.idjadwal,
      this.idfutsaljadwal,
      this.idhari,
      this.jam,
      this.satatus});

  Jam.fromJson(Map<String, dynamic> json) {
    idjadwal = json['idjadwal'];
    idfutsaljadwal = json['idfutsaljadwal'];
    idhari = json['idhari'];
    jam = json['jam'];
    satatus = json['satatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idjadwal'] = this.idjadwal;
    data['idfutsaljadwal'] = this.idfutsaljadwal;
    data['idhari'] = this.idhari;
    data['jam'] = this.jam;
    data['satatus'] = this.satatus;
    return data;
  }
}
