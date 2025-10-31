import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
      final result = await loginUseCase.call(email: email, password: password);
      result.fold((failure){
        emit(LoginFailure(error: failure.message));
      },(authModel){
        emit(LoginSuccess(authModel: authModel));
      });
  }
}