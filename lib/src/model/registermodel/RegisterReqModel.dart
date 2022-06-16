class LoginRequestModel {
  String? nama;
  String? notelp;
  String? username;
  String? passwords;

  LoginRequestModel({this.nama, this.notelp, this.username, this.passwords});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["nama"] = nama;
    data["notelp"] = notelp;
    data["username"] = username;
    data["passwords"] = passwords;
    return data;
  }
}
