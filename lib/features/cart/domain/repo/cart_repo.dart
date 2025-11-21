import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/cart/data/model/add_cart_model.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';
import 'package:hungry/features/cart/data/model/delete_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, AddCartModel>> addCart({required int productId, required int quantity});
  Future<Either<Failure, DeleteCartModel>> deleteCart({required int itemId});
}
