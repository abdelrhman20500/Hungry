import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/features/topping/domain/use_case/topping_use_case.dart';
import 'package:hungry/features/topping/presentation/view_manager/topping_state.dart';

class ToppingCubit extends Cubit<ToppingState> {
  ToppingCubit(this.toppingUseCase) : super(ToppingInitial());
  final ToppingUseCase toppingUseCase;

  Future<void> getTopping() async {
    emit(ToppingLoading());
    var result = await toppingUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ToppingFailure(errMessage: e.message));
    }, (toppingModel) {
      emit(ToppingSuccess(toppingModel: toppingModel));
    });
  }
}
