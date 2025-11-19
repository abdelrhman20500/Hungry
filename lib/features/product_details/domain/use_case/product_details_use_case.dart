import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/product_details/data/model/product_details_model.dart';
import 'package:hungry/features/product_details/domain/repo/product_details_repo.dart';

class ProductDetailsUseCase extends BaseUseCase<ProductDetailsModel, int>{
  final ProductDetailsRepo productDetailsRepo;

  ProductDetailsUseCase({required this.productDetailsRepo});
  @override
  Future<Either<Failure, ProductDetailsModel>> call([int? id])async{
    return await productDetailsRepo.productDetailsData(id: id!);
  }
}