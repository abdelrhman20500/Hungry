
class CartModel {
  int? code;
  String? message;
  Data? data;

  CartModel({this.code, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? totalPrice;
  List<Items>? items;

  Data({this.id, this.totalPrice, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["total_price"] is String) {
      totalPrice = json["total_price"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["total_price"] = totalPrice;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Items {
  int? itemId;
  int? productId;
  String? name;
  String? image;
  int? quantity;
  String? price;
  int? spicy;
  List<dynamic>? toppings;
  List<dynamic>? sideOptions;

  Items({this.itemId, this.productId, this.name, this.image, this.quantity, this.price, this.spicy, this.toppings, this.sideOptions});

  Items.fromJson(Map<String, dynamic> json) {
    if(json["item_id"] is num) {
      itemId = (json["item_id"] as num).toInt();
    }
    if(json["product_id"] is num) {
      productId = (json["product_id"] as num).toInt();
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["quantity"] is num) {
      quantity = (json["quantity"] as num).toInt();
    }
    if(json["price"] is String) {
      price = json["price"];
    }
    if(json["spicy"] is num) {
      spicy = (json["spicy"] as num).toInt();
    }
    if(json["toppings"] is List) {
      toppings = json["toppings"] ?? [];
    }
    if(json["side_options"] is List) {
      sideOptions = json["side_options"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["item_id"] = itemId;
    data["product_id"] = productId;
    data["name"] = name;
    data["image"] = image;
    data["quantity"] = quantity;
    data["price"] = price;
    data["spicy"] = spicy;
    if(toppings != null) {
      data["toppings"] = toppings;
    }
    if(sideOptions != null) {
      data["side_options"] = sideOptions;
    }
    return data;
  }
}