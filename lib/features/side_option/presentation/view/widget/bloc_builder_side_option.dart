import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/side_option/data/data_source/side_option_remote_data_source.dart';
import 'package:hungry/features/side_option/data/repo/side_option_repo_impl.dart';
import 'package:hungry/features/side_option/domain/use_case/side_option_use_case.dart';
import 'package:hungry/features/side_option/presentation/view/widget/side_option_list.dart';
import 'package:hungry/features/side_option/presentation/view_manager/side_option_cubit.dart';
import 'package:hungry/features/side_option/presentation/view_manager/side_option_state.dart';
import '../../../../../core/function/api_service.dart';
import '../../../../../core/utils/error_dialog.dart';


class BlocBuilderSideOption extends StatelessWidget {
  const BlocBuilderSideOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SideOptionCubit(SideOptionUseCase(sideOptionRepo:
      SideOptionRepoImpl(sideOptionBaseRemoteDataSource:
      SideOptionRemoteDataSource(apiService: ApiService(Dio(),),),),),
      )..getSideOption(),
      child: BlocBuilder<SideOptionCubit, SideOptionState>(
        builder: (context, state) {
          if(state is SideOptionLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is SideOptionFailure){
            showErrorDialog(context, state.errMessage);
          }else if(state is SideOptionSuccess){
            return SideOptionList(model: state.sideOptionModel,);
          }return const SizedBox();
        },
      ),
    );
  }
}
