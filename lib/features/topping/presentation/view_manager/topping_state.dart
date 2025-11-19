import 'package:hungry/features/topping/data/model/topping_model.dart';

abstract class ToppingState{}
class ToppingInitial extends ToppingState{}
class ToppingLoading extends ToppingState{}
class ToppingFailure extends ToppingState{
  final String errMessage;
  ToppingFailure({required this.errMessage});
}
class ToppingSuccess extends ToppingState{
  final ToppingModel toppingModel;
  ToppingSuccess({required this.toppingModel});
}