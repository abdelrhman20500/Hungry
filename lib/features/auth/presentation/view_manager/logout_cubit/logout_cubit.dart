import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/features/auth/domain/use_case/log_out_use_case.dart';
import 'package:hungry/features/auth/presentation/view_manager/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState>{
  LogoutCubit(this.logoutUseCase): super(LogoutInitial());

  final LogoutUseCase logoutUseCase;
  Future<void> logout()async{
    emit(LogoutLoading());
    final result = await logoutUseCase.call(const NoParameters());
    result.fold((failure){
      emit(LogoutFailure(errMessage: failure.message));
    },(logoutModel){
      emit(LogoutSuccess(logoutModel: logoutModel));
    });
  }
}