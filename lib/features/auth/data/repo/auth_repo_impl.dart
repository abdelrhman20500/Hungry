import 'package:dartz/dartz.dart';
import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/core/utils/shared_preferences.dart';
import 'package:hungry/features/auth/data/model/auth_model.dart';
import 'package:hungry/features/auth/domain/repo/auth_repo.dart';
import '../../../../core/utils/errors/error_message_model.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, AuthModel>> login(
      {required String email, required String password}) async {
    var response = await apiService
        .post("login", {"email": email, "password": password});
    if (response.statusCode == 200) {
      final authModel = AuthModel.fromJson(response.data);
      SharedPref.saveToken(authModel.data!.token!);
      print(authModel.data!.token!);
      print(authModel.message);
      return Right(authModel);
    } else {
      final errorModel = ErrorMessageModel.fromJson(response.data);
      return Left(ServerFailure(errorModel.message));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> register(RegisterParameters parameters)async{
    var response = await apiService
        .post("register", parameters.data);
    if (response.statusCode! >= 200 && response.statusCode! <=300) {
      final authModel = AuthModel.fromJson(response.data);
      SharedPref.saveToken(authModel.data!.token!);
      print(authModel.message);
      print(authModel.data!.token!);
      return Right(authModel);
    } else {
      final errorModel = ErrorMessageModel.fromJson(response.data);
      return Left(ServerFailure(errorModel.message));
    }
  }
}
