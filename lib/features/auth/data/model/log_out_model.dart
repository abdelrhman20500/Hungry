
class LogoutModel {
  int? code;
  String? message;
  dynamic data;

  LogoutModel({this.code, this.message, this.data});

  LogoutModel.fromJson(Map<String, dynamic> json) {
    if(json["code"] is num) {
      code = (json["code"] as num).toInt();
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = data;
    return data;
  }
}