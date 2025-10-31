import 'package:dartz/dartz.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/auth/data/model/auth_model.dart';
import 'package:hungry/features/auth/domain/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Either<Failure, AuthModel>> call(
      {required String email, required String password}) async {
    return await authRepo.login(email: email, password: password);
  }
}
