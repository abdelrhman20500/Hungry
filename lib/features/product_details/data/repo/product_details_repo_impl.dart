import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/product_details/data/data_source/product_details_remote_date_source.dart';
import 'package:hungry/features/product_details/data/model/product_details_model.dart';
import 'package:hungry/features/product_details/domain/repo/product_details_repo.dart';

import '../../../../core/utils/errors/exception.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo{

  final ProductDetailsBaseRemoteDataSource productDetailsBaseRemoteDataSource;

  ProductDetailsRepoImpl({required this.productDetailsBaseRemoteDataSource});
  @override
  Future<Either<Failure, ProductDetailsModel>> productDetailsData({required int id})async{
    try {
      var result = await productDetailsBaseRemoteDataSource.productDetailsData(id: id);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}