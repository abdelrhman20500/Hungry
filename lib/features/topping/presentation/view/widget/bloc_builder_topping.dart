import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/topping/presentation/view/widget/topping_list.dart';
import '../../../../../core/function/api_service.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../data/data_source/topping_remote_data_source.dart';
import '../../../data/repo/topping_repo_impl.dart';
import '../../../domain/use_case/topping_use_case.dart';
import '../../view_manager/topping_cubit.dart';
import '../../view_manager/topping_state.dart';

class BlocBuilderTopping extends StatelessWidget {
  const BlocBuilderTopping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToppingCubit(ToppingUseCase(toppingRepo:
      ToppingRepoImpl(toppingBaseRemoteDataSource:
      ToppingRemoteDataSource(apiService: ApiService(Dio(),),),),),
      )..getTopping(),
      child: BlocBuilder<ToppingCubit, ToppingState>(
        builder: (context, state) {
          if(state is ToppingLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is ToppingFailure){
            showErrorDialog(context, state.errMessage);
          }else if(state is ToppingSuccess){
            return ToppingList(model: state.toppingModel,);
          }return const SizedBox();
        },
      ),
    );
  }
}
