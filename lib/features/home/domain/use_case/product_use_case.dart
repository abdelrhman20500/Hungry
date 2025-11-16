import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/home/data/model/product_model.dart';
import 'package:hungry/features/home/domain/repo/product_repo.dart';

class ProductUseCase extends BaseUseCase<List<Data>, NoParameters>{
  final ProductRepo productRepo;

  ProductUseCase({required this.productRepo});
  @override
  Future<Either<Failure, List<Data>>> call(NoParameters parameters)async{
    return await productRepo.getProduct();
  }

}