import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/core/utils/error_dialog.dart';
import 'package:hungry/features/home/data/data_source/product_remote_data_source.dart';
import 'package:hungry/features/home/data/repo/product_repo_impl.dart';
import 'package:hungry/features/home/domain/use_case/product_use_case.dart';
import 'package:hungry/features/home/presentation/product_cubit/product_cubit.dart';
import 'package:hungry/features/home/presentation/view/widgets/product_list.dart';
import '../../product_cubit/product_state.dart';


class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductUseCase(productRepo: ProductRepoImpl(
          productBaseRemoteDataSource:ProductRemoteDataSource(apiService: ApiService(Dio(),),),
      ),),)..productDate(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if(state is ProductLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is ProductFailure){
            showErrorDialog(context, state.errMessage.toString());
          }else if(state is ProductSuccess){
            return ProductList(model: state.productModel);
          }return Container();
        },
      ),
    );
  }
}