import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/cart/data/data_source/add_cart_remote_data_source.dart';
import 'package:hungry/features/cart/data/model/add_cart_model.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';
import 'package:hungry/features/cart/data/model/delete_cart_model.dart';
import 'package:hungry/features/cart/domain/repo/cart_repo.dart';
import '../../../../core/utils/errors/exception.dart';

class AddCartRepoImpl extends CartRepo{
  final AddCartBaseRemoteDataSource addCartBaseRemoteDataSource;

  AddCartRepoImpl({required this.addCartBaseRemoteDataSource});

  @override
  Future<Either<Failure, AddCartModel>> addCart({required int productId, required int quantity})async{
    try {
      var result = await addCartBaseRemoteDataSource.addCart(productId: productId, quantity: quantity);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart()async{
    try {
      var result= await addCartBaseRemoteDataSource.getCart();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, DeleteCartModel>> deleteCart({required int itemId})async{
    try {
      var result= await addCartBaseRemoteDataSource.deleteCart(itemId: itemId);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
  
}