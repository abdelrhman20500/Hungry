import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/topping/data/model/topping_model.dart';

abstract class ToppingRepo{
  Future<Either<Failure, ToppingModel>> toppingData();
}