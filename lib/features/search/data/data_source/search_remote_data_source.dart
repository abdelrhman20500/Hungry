import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/features/search/data/model/search_model.dart';

import '../../../../core/utils/errors/error_message_model.dart';
import '../../../../core/utils/errors/exception.dart';

abstract class SearchBaseRemoteDataSource {
  Future<List<SearchData>> searchProduct({required String query});
}

class SearchRemoteDataSource extends SearchBaseRemoteDataSource{
  final ApiService apiService;

  SearchRemoteDataSource({required this.apiService});

  @override
  Future<List<SearchData>> searchProduct({required String query})async {
    var response = await apiService.get(
      endpoint: "products?name=$query",
      // token: SharedPref.getToken(),
    );

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'];
      print(dataList);
      return dataList.map((e) => SearchData.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}