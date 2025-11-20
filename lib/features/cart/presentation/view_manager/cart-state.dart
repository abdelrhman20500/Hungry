import 'package:hungry/features/cart/data/model/cart_model.dart';
import 'package:hungry/features/cart/data/model/delete_cart_model.dart';
import '../../data/model/add_cart_model.dart';

abstract class CartState{}
class CartInitial extends CartState{}
class CartLoading extends CartState{}
class CartEmpty extends CartState {}
class CartFailure extends CartState{
  final String errMessage;
  CartFailure({required this.errMessage});
}
class CartSuccess extends CartState{
  final CartModel cartModel;
  CartSuccess({required this.cartModel});
}

class AddCartLoading extends CartState{}
class AddCartFailure extends CartState{
  final String errMessage;
  AddCartFailure({required this.errMessage});
}
class AddCartSuccess extends CartState{
  final AddCartModel addCartModel;
  AddCartSuccess({required this.addCartModel});
}
class DeleteCartLoading extends CartState{}
class DeleteCartFailure extends CartState{
  final String errMessage;
  DeleteCartFailure({required this.errMessage});
}
class DeleteCartSuccess extends CartState{
  final DeleteCartModel deleteCartModel;

  DeleteCartSuccess({required this.deleteCartModel});
}