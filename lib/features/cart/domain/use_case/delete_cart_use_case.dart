import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/cart/data/model/delete_cart_model.dart';
import 'package:hungry/features/cart/domain/repo/cart_repo.dart';

class DeleteCartUseCase extends BaseUseCase<DeleteCartModel, int>{
  final CartRepo cartRepo;

  DeleteCartUseCase({required this.cartRepo});
  @override
  Future<Either<Failure, DeleteCartModel>> call([int? itemId])async{
    return await cartRepo.deleteCart(itemId: itemId!);
  }

}