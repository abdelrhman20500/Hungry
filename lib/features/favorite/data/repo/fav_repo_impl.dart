import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/favorite/data/data_source/add_or_remove_remote_data_source.dart';
import 'package:hungry/features/favorite/data/model/add_or_remove_fav_model.dart';
import 'package:hungry/features/favorite/data/model/fav_model.dart';
import 'package:hungry/features/favorite/domain/repo/fav_repo.dart';
import '../../../../core/utils/errors/exception.dart';

class FavRepoImpl extends FavRepo{
  final AddOrRemoveRemoteDataSource addOrRemoveRemoteDataSource;

  FavRepoImpl({required this.addOrRemoveRemoteDataSource});
  @override
  Future<Either<Failure, AddOrRemoveFavModel>> addOrRemoveFav({required int id})async{
    try {
      var result = await addOrRemoveRemoteDataSource.addOrRemoveFav(id: id);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, FavModel>> getFavorite()async{
    try {
      var result = await addOrRemoveRemoteDataSource.getFavorite();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}