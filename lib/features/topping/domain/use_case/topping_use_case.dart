import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/topping/data/model/topping_model.dart';
import 'package:hungry/features/topping/domain/repo/topping_repo.dart';

class ToppingUseCase extends BaseUseCase<ToppingModel, NoParameters>{

  final ToppingRepo toppingRepo;

  ToppingUseCase({required this.toppingRepo});
  @override
  Future<Either<Failure, ToppingModel>> call(NoParameters parameters)async{
    return await toppingRepo.toppingData();
  }
}