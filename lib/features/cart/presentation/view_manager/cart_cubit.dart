import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';
import 'package:hungry/features/cart/domain/use_case/add_cart_use_case.dart';
import 'package:hungry/features/cart/domain/use_case/cart_use_case.dart';
import 'package:hungry/features/cart/domain/use_case/delete_cart_use_case.dart';
import 'package:hungry/features/cart/presentation/view_manager/cart-state.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit(this.addCartUseCase, this.cartUseCase, this.deleteCartUseCase): super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
  final CartUseCase cartUseCase;
  final AddCartUseCase addCartUseCase;
  final DeleteCartUseCase deleteCartUseCase;

  List<Items> getDataCart =[];
  Future<void> getCart()async{
    emit(CartLoading());
    var result =await cartUseCase.call(const NoParameters());
    result.fold((e){
      emit(CartFailure(errMessage: e.message));
    }, (cartModel){
      getDataCart= cartModel.data!.items ?? [];
      emit(CartSuccess(cartModel: cartModel));
    });
  }
  Future<void> addCart(int productId)async{
    emit(AddCartLoading());
    var result =await addCartUseCase.call(productId);
    result.fold((e){
      emit(AddCartFailure(errMessage: e.message));
    }, (addCartModel){
      getCart();
      emit(AddCartSuccess(addCartModel: addCartModel));
    });
  }
  Future<void>deleteCart(int itemId)async{
    emit(DeleteCartLoading());
    var result =await deleteCartUseCase.call(itemId);
    result.fold((e){
      emit(DeleteCartFailure(errMessage: e.message));
    }, (deleteCartModel){
      getCart();
      emit(DeleteCartSuccess(deleteCartModel: deleteCartModel));
    });
  }
}