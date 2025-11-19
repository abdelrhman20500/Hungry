import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/features/side_option/domain/use_case/side_option_use_case.dart';
import 'package:hungry/features/side_option/presentation/view_manager/side_option_state.dart';


class SideOptionCubit extends Cubit<SideOptionState> {
  SideOptionCubit(this.sideOptionUseCase) : super(SideOptionInitial());
  final SideOptionUseCase sideOptionUseCase;

  Future<void> getSideOption() async {
    emit(SideOptionLoading());
    var result = await sideOptionUseCase.call(const NoParameters());
    result.fold((e) {
      emit(SideOptionFailure(errMessage: e.message));
    }, (sideOptionModel) {
      emit(SideOptionSuccess(sideOptionModel: sideOptionModel));
    });
  }
}
