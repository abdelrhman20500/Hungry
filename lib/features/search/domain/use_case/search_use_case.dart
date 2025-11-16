import 'package:dartz/dartz.dart';
import 'package:hungry/core/base_use_case/base_use_case.dart';
import 'package:hungry/core/utils/errors/failure.dart';
import 'package:hungry/features/search/data/model/search_model.dart';
import 'package:hungry/features/search/domain/repo/search_repo.dart';

class SearchUseCase extends BaseUseCase<List<SearchData>, String>{
  final SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});
  @override
  Future<Either<Failure, List<SearchData>>> call([String? query])async{
    return await searchRepo.searchProduct(query: query!);
  }
  
}