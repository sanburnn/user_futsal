class LoginRequestModel {
  String? username;
  String? passwords;

  LoginRequestModel({this.username, this.passwords});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = username;
    data["passwords"] = passwords;
    return data;
  }
}
