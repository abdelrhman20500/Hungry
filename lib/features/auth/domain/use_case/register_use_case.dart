
import 'package:dartz/dartz.dart';
import 'package:hungry/features/auth/data/model/auth_model.dart';

import '../../../../core/utils/errors/failure.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase{
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<Failure, AuthModel>> call(RegisterParameters parameters) async {
    return await authRepo.register(parameters);
  }
}