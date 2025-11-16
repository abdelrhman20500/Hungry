import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/home/data/model/product_model.dart';

abstract class ProductRepo{
  Future<Either<Failure, List<Data>>> getProduct();
}