import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/features/home/presentation/product_cubit/product_state.dart';
import '../../domain/use_case/product_use_case.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit(this.productUseCase):super(ProductInitial());
  final ProductUseCase productUseCase;


  Future<void> productDate() async {
    emit(ProductLoading());
    var result = await productUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ProductFailure(errMessage: e.message));
    }, (productModel) {
      emit(ProductSuccess(productModel: productModel));
    });
  }
}