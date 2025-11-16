import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/features/home/data/model/product_model.dart';

import '../../../../core/utils/errors/error_message_model.dart';
import '../../../../core/utils/errors/exception.dart';

abstract class ProductBaseRemoteDataSource{
  Future<List<Data>> getProduct();
}

class ProductRemoteDataSource extends ProductBaseRemoteDataSource{

  final ApiService apiService;

  ProductRemoteDataSource({required this.apiService});
  @override
  Future<List<Data>> getProduct()async{
    var response = await apiService.get(
      endpoint: "products",
    );

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'];
      // print(dataList);
      return dataList.map((e) => Data.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}