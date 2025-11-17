import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/favorite/data/model/add_or_remove_fav_model.dart';
import 'package:hungry/features/favorite/data/model/fav_model.dart';

abstract class FavRepo{
  Future<Either<Failure, AddOrRemoveFavModel>> addOrRemoveFav({required int id});
  Future<Either<Failure, FavModel>> getFavorite();

}