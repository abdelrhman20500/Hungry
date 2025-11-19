import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/product_details/data/model/product_details_model.dart';

abstract class ProductDetailsRepo{
  Future<Either<Failure, ProductDetailsModel>> productDetailsData({required int id});
}