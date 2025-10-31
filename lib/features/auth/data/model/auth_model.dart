
class AuthModel {
  int? code;
  String? message;
  Data? data;

  AuthModel({this.code, this.message, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    if(json["code"] is num) {
      code = (json["code"] as num).toInt();
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? token;
  String? name;
  String? email;
  String? image;

  Data({this.token, this.name, this.email, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    data["name"] = name;
    data["email"] = email;
    data["image"] = image;
    return data;
  }
}