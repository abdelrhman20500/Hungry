import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/search/domain/use_case/search_use_case.dart';
import 'package:hungry/features/search/presentation/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(this.searchUseCase):super(SearchInitial());
  final SearchUseCase searchUseCase;


  Future<void> searchProduct({required String query}) async {
    emit(SearchLoading());
    var result = await searchUseCase.call(query);
    result.fold((e) {
      emit(SearchFailure(errMessage: e.message));
    }, (searchModel) {
      emit(SearchSuccess(searchData: searchModel));
    });
  }
}