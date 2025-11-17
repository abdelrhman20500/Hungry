import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/favorite/data/model/fav_model.dart';
import 'package:hungry/features/favorite/domain/repo/fav_repo.dart';

class FavUseCase extends BaseUseCase<FavModel, NoParameters>{
  final FavRepo favRepo;

  FavUseCase({required this.favRepo});
  @override
  Future<Either<Failure, FavModel>> call(NoParameters parameters)async{
    return await favRepo.getFavorite();
  }
}