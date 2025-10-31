import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/auth/presentation/view_manager/register_cubit/register_state.dart';
import '../../../domain/repo/auth_repo.dart';
import '../../../domain/use_case/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  Future<void> register(String email, String password, String name, String phone) async {
    emit(RegisterLoading());
    final parameters = RegisterParameters({
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    });
    final result = await registerUseCase.call(parameters);
    result.fold((failure) {
      emit(RegisterFailure(error: failure.message));
    }, (authModel) {
      emit(RegisterSuccess(authModel: authModel));
    });
  }
}
