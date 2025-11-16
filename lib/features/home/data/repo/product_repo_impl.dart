import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/home/data/data_source/product_remote_data_source.dart';
import 'package:hungry/features/home/data/model/product_model.dart';
import 'package:hungry/features/home/domain/repo/product_repo.dart';
import '../../../../core/utils/errors/exception.dart';

class ProductRepoImpl extends ProductRepo{
  final ProductBaseRemoteDataSource productBaseRemoteDataSource;

  ProductRepoImpl({required this.productBaseRemoteDataSource});
  @override
  Future<Either<Failure, List<Data>>> getProduct()async{
    try {
      var result = await productBaseRemoteDataSource.getProduct();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}