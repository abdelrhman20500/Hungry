import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/auth/data/model/log_out_model.dart';
import 'package:hungry/features/auth/domain/repo/auth_repo.dart';

class LogoutUseCase extends BaseUseCase<LogoutModel, NoParameters>{
  final AuthRepo authRepo;

  LogoutUseCase({required this.authRepo});
  @override
  Future<Either<Failure, LogoutModel>> call(NoParameters parameters)async{
    return await authRepo.logout();
  }
}