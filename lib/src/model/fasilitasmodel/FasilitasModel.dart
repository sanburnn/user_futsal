import 'dart:convert';

FasilitasModel fasilitasFromJson(String str) =>
    FasilitasModel.fromJson(json.decode(str));

String fasilitasToJson(FasilitasModel data) => json.encode(data.toJson());

class FasilitasModel {
  int? status;
  String? message;
  List<Fasilitas>? data;

  FasilitasModel({this.status, this.message, this.data});

  FasilitasModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Fasilitas>[];
      json['data'].forEach((v) {
        data!.add(new Fasilitas.fromJson(v));
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

class Fasilitas {
  String? idFasilitas;
  String? idfutsalap;
  String? nama;
  String? foto;
  String? deskripsi;

  Fasilitas(
      {this.idFasilitas,
      this.idfutsalap,
      this.nama,
      this.foto,
      this.deskripsi});

  Fasilitas.fromJson(Map<String, dynamic> json) {
    idFasilitas = json['id_fasilitas'];
    idfutsalap = json['idfutsalap'];
    nama = json['nama'];
    foto = json['foto'];
    deskripsi = json['deskripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_fasilitas'] = this.idFasilitas;
    data['idfutsalap'] = this.idfutsalap;
    data['nama'] = this.nama;
    data['foto'] = this.foto;
    data['deskripsi'] = this.deskripsi;
    return data;
  }
}
