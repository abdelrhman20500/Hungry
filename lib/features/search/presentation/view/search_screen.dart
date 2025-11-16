import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/search/presentation/view/widget/list_search_item.dart';
import '../../../../core/function/api_service.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../data/data_source/search_remote_data_source.dart';
import '../../data/repo/search_repo_impl.dart';
import '../../domain/use_case/search_use_case.dart';
import '../search_cubit/search_cubit.dart';
import '../search_cubit/search_state.dart';

class SearchScreen extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(onPressed: ()
    {
      buildResults(context);
    }, icon: const Icon(Icons.search),color: Colors.black54);
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()
    {
      Navigator.pop(context);
    }, icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchUseCase(searchRepo: SearchRepoImpl(
        searchBaseRemoteDataSource:SearchRemoteDataSource(apiService: ApiService(Dio(),),),),
      ),)..searchProduct(query: query),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if(state is SearchLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is SearchFailure){
            showErrorDialog(context, state.errMessage.toString());
          }else if(state is SearchSuccess){
            return ListSearchItem(model: state.searchData);
          }return const Center(
            child: Text("Products is Empty", style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold,color: Colors.black
            ),),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchUseCase(searchRepo: SearchRepoImpl(
        searchBaseRemoteDataSource:SearchRemoteDataSource(apiService: ApiService(Dio(),),),),
      ),)..searchProduct(query: query),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if(state is SearchLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is SearchFailure){
            showErrorDialog(context, state.errMessage.toString());
          }else if(state is SearchSuccess){
            return ListSearchItem(model: state.searchData);
          }return const Center(
            child: Text("Products is Empty", style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold,color: Colors.black
            ),),
          );
        },
      ),
    );
  }
}