import '../../../data/model/auth_model.dart';

abstract class RegisterState{}
class RegisterInitial extends RegisterState{}
class RegisterLoading extends RegisterState{}
class RegisterFailure extends RegisterState{
  final String error;
  RegisterFailure({required this.error});
}
class RegisterSuccess extends RegisterState{
  final AuthModel authModel;
  RegisterSuccess({required this.authModel});
}