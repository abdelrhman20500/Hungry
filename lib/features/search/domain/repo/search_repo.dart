import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/search/data/model/search_model.dart';

abstract class SearchRepo{
  Future<Either<Failure, List<SearchData>>> searchProduct({required String query});
}