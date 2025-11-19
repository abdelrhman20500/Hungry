import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/product_details/domain/use_case/product_details_use_case.dart';
import 'package:hungry/features/product_details/presentation/view_manager/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productDetailsUseCase)
      : super(ProductDetailsInitial());

  final ProductDetailsUseCase productDetailsUseCase;

  Future<void> productDetails({required int id}) async {
    emit(ProductDetailsLoading());
    var result = await productDetailsUseCase.call(id);
    result.fold((e) {
      emit(ProductDetailsFailure(errMessage: e.message));
    }, (productDetailsModel) {
      emit(ProductDetailsSuccess(productDetailsModel: productDetailsModel));
    });
  }
}
