import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/core/utils/shared_preferences.dart';
import 'package:hungry/features/cart/data/model/add_cart_model.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';
import 'package:hungry/features/cart/data/model/delete_cart_model.dart';
import '../../../../core/utils/errors/error_message_model.dart';
import '../../../../core/utils/errors/exception.dart';

abstract class AddCartBaseRemoteDataSource {
  Future<CartModel> getCart();
  Future<AddCartModel> addCart({required int productId, required int quantity});
  Future<DeleteCartModel> deleteCart({required int itemId});
}

class AddCartRemoteDataSource extends AddCartBaseRemoteDataSource{
  final ApiService apiService;

  AddCartRemoteDataSource({required this.apiService});
  @override
  Future<AddCartModel> addCart({required int productId, required int quantity})async{
    final body = {
      "items": [
        {
          "product_id": productId,
          "quantity": quantity,
        }
      ]
    };
    var response = await apiService.post("cart/add",body,
      token: SharedPref.getToken().toString()
    );
    if(response.statusCode == 200){
      final Map<String, dynamic> productCart = response.data;
      // print("@@@@@");
      // print(productCart);
      return AddCartModel.fromJson(productCart);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CartModel> getCart()async{
    var response = await apiService.get(endpoint:"cart",
    token: SharedPref.getToken().toString());
    if(response.statusCode == 200){
      final Map<String, dynamic> productCart = response.data;
      // print("@@@@@");
      // print(productCart);
      return CartModel.fromJson(productCart);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<DeleteCartModel> deleteCart({required int itemId})async{
    var response = await apiService.delete(
      endPoint: "cart/remove/$itemId",
      token: SharedPref.getToken().toString(),
    );
    if(response.statusCode == 200){
      final Map<String, dynamic> productCart = response.data;
      print("@@@@@");
      print(productCart);
      return DeleteCartModel.fromJson(productCart);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}