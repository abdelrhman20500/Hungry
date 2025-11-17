import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/favorite/data/model/add_or_remove_fav_model.dart';
import 'package:hungry/features/favorite/domain/repo/fav_repo.dart';

class AddOrRemoveFavUseCase extends BaseUseCase<AddOrRemoveFavModel, int>{
  final FavRepo favRepo;

  AddOrRemoveFavUseCase({required this.favRepo});
  @override
  Future<Either<Failure, AddOrRemoveFavModel>> call([int? id])async{
    return await favRepo.addOrRemoveFav(id: id!);
  }

}