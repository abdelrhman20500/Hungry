import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/side_option/data/model/ide_option_model.dart';
import 'package:hungry/features/side_option/domain/repo/side_option_repo.dart';

class SideOptionUseCase extends BaseUseCase<SideOptionModel, NoParameters>{

  final SideOptionRepo sideOptionRepo;

  SideOptionUseCase({required this.sideOptionRepo});
  @override
  Future<Either<Failure, SideOptionModel>> call(NoParameters parameters)async{
   return await sideOptionRepo.sideOptionData();
  }
}