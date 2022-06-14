import 'dart:convert';

PertandinganModel pertandinganFromJson(String str) =>
    PertandinganModel.fromJson(json.decode(str));

String pertandinganToJson(PertandinganModel data) => json.encode(data.toJson());

class PertandinganModel {
  int? status;
  String? message;
  List<Pertandingan>? data;

  PertandinganModel({this.status, this.message, this.data});

  PertandinganModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Pertandingan>[];
      json['data'].forEach((v) {
        data!.add(new Pertandingan.fromJson(v));
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

class Pertandingan {
  String? idTransaksi;
  String? idfutsal;
  String? idpengguna;
  String? nama;
  String? notelp;
  String? tanggal;
  String? jam;
  String? bukti;
  String? satatus;

  Pertandingan(
      {this.idTransaksi,
      this.idfutsal,
      this.idpengguna,
      this.nama,
      this.notelp,
      this.tanggal,
      this.jam,
      this.bukti,
      this.satatus});

  Pertandingan.fromJson(Map<String, dynamic> json) {
    idTransaksi = json['id_transaksi'];
    idfutsal = json['idfutsal'];
    idpengguna = json['idpengguna'];
    nama = json['nama'];
    notelp = json['notelp'];
    tanggal = json['tanggal'];
    jam = json['jam'];
    bukti = json['bukti'];
    satatus = json['satatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_transaksi'] = this.idTransaksi;
    data['idfutsal'] = this.idfutsal;
    data['idpengguna'] = this.idpengguna;
    data['nama'] = this.nama;
    data['notelp'] = this.notelp;
    data['tanggal'] = this.tanggal;
    data['jam'] = this.jam;
    data['bukti'] = this.bukti;
    data['satatus'] = this.satatus;
    return data;
  }
}
