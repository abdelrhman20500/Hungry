import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/topping/data/data_source/topping_remote_data_source.dart';
import 'package:hungry/features/topping/data/model/topping_model.dart';
import 'package:hungry/features/topping/domain/repo/topping_repo.dart';

import '../../../../core/utils/errors/exception.dart';

class ToppingRepoImpl extends ToppingRepo{
  final ToppingBaseRemoteDataSource toppingBaseRemoteDataSource;

  ToppingRepoImpl({required this.toppingBaseRemoteDataSource});
  @override
  Future<Either<Failure, ToppingModel>> toppingData()async{
    try {
      var result = await toppingBaseRemoteDataSource.toppingData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}