import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/product_details/presentation/view/widget/product_details_bloc_builder.dart';
import 'package:hungry/features/side_option/presentation/view/widget/bloc_builder_side_option.dart';
import '../../../../core/function/api_service.dart';
import '../../../topping/presentation/view/widget/bloc_builder_topping.dart';
import '../../data/data_source/product_details_remote_date_source.dart';
import '../../data/repo/product_details_repo_impl.dart';
import '../../domain/use_case/product_details_use_case.dart';
import '../view_manager/product_details_cubit.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductDetailsCubit(ProductDetailsUseCase(productDetailsRepo:
      ProductDetailsRepoImpl(productDetailsBaseRemoteDataSource:
      ProductDetailsRemoteDataSource(apiService: ApiService(Dio(),),),),),
      )..productDetails(id: id),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title: const Text("Details"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ProductDetailsBlocBuilder(),
                SizedBox(height: height*0.01,),
                const Text("Topping", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,
                color: Colors.black),),
                SizedBox(height: height*0.01,),
                const BlocBuilderTopping(),
                SizedBox(height: height*0.01,),
                const Text("Side Option", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,
                    color: Colors.black),),
                SizedBox(height: height*0.01,),
                const BlocBuilderSideOption(),
                SizedBox(height: height*0.01),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text("Total price", style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),),
                          Text("EGP {${ "0.0"}}", style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600,color: Color(0xff08431D)),),
                        ],
                      ),
                      Container(
                        height: height*0.06,
                        width: width*0.5,
                        decoration: BoxDecoration(
                            color: const Color(0xff08431D),
                            borderRadius: BorderRadius.circular(16.0)
                        ),
                        child: Center(child: TextButton(onPressed: (){}, child: const Text("Check Out", style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white
                        ),))
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






