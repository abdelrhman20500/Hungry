import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/search/data/data_source/search_remote_data_source.dart';
import 'package:hungry/features/search/data/model/search_model.dart';
import 'package:hungry/features/search/domain/repo/search_repo.dart';

import '../../../../core/utils/errors/exception.dart';

class SearchRepoImpl extends SearchRepo{

  final SearchBaseRemoteDataSource searchBaseRemoteDataSource;

  SearchRepoImpl({required this.searchBaseRemoteDataSource});
  @override
  Future<Either<Failure, List<SearchData>>> searchProduct({required String query})async{
    try {
      var result = await searchBaseRemoteDataSource.searchProduct(query: query);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}