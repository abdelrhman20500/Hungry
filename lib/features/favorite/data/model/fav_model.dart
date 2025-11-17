
class FavModel {
  int? code;
  String? message;
  List<DataFavorites>? data;

  FavModel({this.code, this.message, this.data});

  FavModel.fromJson(Map<String, dynamic> json) {
    if(json["code"] is num) {
      code = (json["code"] as num).toInt();
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => DataFavorites.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class DataFavorites {
  int? id;
  String? name;
  String? description;
  String? image;
  String? rating;
  String? price;
  bool? isFavorite;

  DataFavorites({this.id, this.name, this.description, this.image, this.rating, this.price, this.isFavorite});

  DataFavorites.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["rating"] is String) {
      rating = json["rating"];
    }
    if(json["price"] is String) {
      price = json["price"];
    }
    if(json["is_favorite"] is bool) {
      isFavorite = json["is_favorite"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["image"] = image;
    data["rating"] = rating;
    data["price"] = price;
    data["is_favorite"] = isFavorite;
    return data;
  }
}