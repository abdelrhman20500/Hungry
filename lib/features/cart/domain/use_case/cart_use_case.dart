import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';
import 'package:hungry/features/cart/domain/repo/cart_repo.dart';

class CartUseCase extends BaseUseCase<CartModel, NoParameters>{
  final CartRepo cartRepo;

  CartUseCase({required this.cartRepo});
  @override
  Future<Either<Failure, CartModel>> call(NoParameters parameters)async{
    return await cartRepo.getCart();
  }

}