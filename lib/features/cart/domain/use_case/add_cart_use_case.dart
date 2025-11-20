import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/cart/data/model/add_cart_model.dart';
import 'package:hungry/features/cart/domain/repo/cart_repo.dart';

class AddCartUseCase extends BaseUseCase<AddCartModel, int>{
  final CartRepo cartRepo;

  AddCartUseCase({required this.cartRepo});
  @override
  Future<Either<Failure, AddCartModel>> call([int? id])async{
    return await cartRepo.addCart(productId: id!);
  }

}