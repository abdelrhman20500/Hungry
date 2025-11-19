import 'package:hungry/features/product_details/data/model/product_details_model.dart';

abstract class ProductDetailsState{}
class ProductDetailsInitial extends ProductDetailsState{}
class ProductDetailsLoading extends ProductDetailsState{}
class ProductDetailsFailure extends ProductDetailsState{
  final String errMessage;
  ProductDetailsFailure({required this.errMessage});
}
class ProductDetailsSuccess extends ProductDetailsState{
  final ProductDetailsModel productDetailsModel;
  ProductDetailsSuccess({required this.productDetailsModel});
}