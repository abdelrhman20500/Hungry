import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/side_option/data/data_source/side_option_remote_data_source.dart';
import 'package:hungry/features/side_option/data/model/ide_option_model.dart';
import 'package:hungry/features/side_option/domain/repo/side_option_repo.dart';

import '../../../../core/utils/errors/exception.dart';

class SideOptionRepoImpl extends SideOptionRepo{

  final SideOptionBaseRemoteDataSource sideOptionBaseRemoteDataSource;

  SideOptionRepoImpl({required this.sideOptionBaseRemoteDataSource});
  @override
  Future<Either<Failure, SideOptionModel>> sideOptionData()async{
    try {
      var result = await sideOptionBaseRemoteDataSource.sideOptionData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}