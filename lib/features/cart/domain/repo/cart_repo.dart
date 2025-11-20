import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/cart/data/model/add_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, AddCartModel>> addCart({AddCartParameters parameters});
}

class AddCartParameters extends Equatable {
  final String productId;
  final int count;

  const AddCartParameters({
    required this.productId,
    required this.count,
  });

  @override
  List<Object?> get props => [productId, count];
}