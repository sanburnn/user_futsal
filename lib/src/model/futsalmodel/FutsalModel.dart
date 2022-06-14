import 'dart:convert';

FutsalModel futsalFromJson(String str) =>
    FutsalModel.fromJson(json.decode(str));

String futsalToJson(FutsalModel data) => json.encode(data.toJson());

class FutsalModel {
  String? message;
  List<Futsal>? data;

  FutsalModel({this.message, this.data});

  FutsalModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Futsal>[];
      json['data'].forEach((v) {
        data!.add(new Futsal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Futsal {
  int? idFutsal;
  String? namatempat;
  String? foto;
  String? deskripsi;
  int? notelp;
  String? alamat;
  int? harga;

  Futsal(
      {this.idFutsal,
      this.namatempat,
      this.foto,
      this.deskripsi,
      this.notelp,
      this.alamat,
      this.harga});

  Futsal.fromJson(Map<String, dynamic> json) {
    idFutsal = json['id_futsal'];
    namatempat = json['namatempat'];
    foto = json['foto'];
    deskripsi = json['deskripsi'];
    notelp = json['notelp'];
    alamat = json['alamat'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_futsal'] = this.idFutsal;
    data['namatempat'] = this.namatempat;
    data['foto'] = this.foto;
    data['deskripsi'] = this.deskripsi;
    data['notelp'] = this.notelp;
    data['alamat'] = this.alamat;
    data['harga'] = this.harga;
    return data;
  }
}
