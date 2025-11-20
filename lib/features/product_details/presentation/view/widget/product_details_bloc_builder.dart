import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/utils/error_dialog.dart';
import 'package:hungry/features/product_details/presentation/view/widget/product_details_item.dart';
import 'package:hungry/features/product_details/presentation/view_manager/product_details_cubit.dart';
import 'package:hungry/features/product_details/presentation/view_manager/product_details_state.dart';

class ProductDetailsBlocBuilder extends StatelessWidget {
  const ProductDetailsBlocBuilder({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if(state is ProductDetailsLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is ProductDetailsFailure){
            showErrorDialog(context, state.errMessage);
          }else if(state is ProductDetailsSuccess){
           return ProductDetailsItem(
             id: state.productDetailsModel.data!.id!,
             image: state.productDetailsModel.data!.image!,
             title: state.productDetailsModel.data!.name!,
             description: state.productDetailsModel.data!.description!,
             price: state.productDetailsModel.data!.price!,
             rating: state.productDetailsModel.data!.rating!,
           );
          }
          return const SizedBox();
        },
    );
  }
}
