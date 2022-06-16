import 'dart:convert';

TransaksiModel transaksiFromJson(String str) =>
    TransaksiModel.fromJson(json.decode(str));

String transaksiToJson(TransaksiModel data) => json.encode(data.toJson());

class TransaksiModel {
  int? status;
  String? message;
  List<Transaksi>? data;

  TransaksiModel({this.status, this.message, this.data});

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Transaksi>[];
      json['data'].forEach((v) {
        data!.add(new Transaksi.fromJson(v));
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

class Transaksi {
  String? idTransaksi;
  String? idfutsal;
  String? idpengguna;
  String? nama;
  String? notelp;
  String? tanggal;
  String? jam;
  String? bukti;
  String? satatus;

  Transaksi(
      {this.idTransaksi,
      this.idfutsal,
      this.idpengguna,
      this.nama,
      this.notelp,
      this.tanggal,
      this.jam,
      this.bukti,
      this.satatus});

  Transaksi.fromJson(Map<String, dynamic> json) {
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
