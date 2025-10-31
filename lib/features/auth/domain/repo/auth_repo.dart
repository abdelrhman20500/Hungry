import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/auth/data/model/auth_model.dart';

abstract class AuthRepo{
  Future<Either<Failure,AuthModel>> login({required String email, required String password});
  Future<Either<Failure,AuthModel>> register(RegisterParameters parameters);
}
class RegisterParameters extends Equatable {
  final Map<String, dynamic> data;

  const RegisterParameters(this.data);

  @override
  List<Object?> get props => [
    data,
  ];
}