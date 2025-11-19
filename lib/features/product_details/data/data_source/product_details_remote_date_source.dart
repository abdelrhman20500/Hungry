import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/features/product_details/data/model/product_details_model.dart';

import '../../../../core/utils/errors/error_message_model.dart';
import '../../../../core/utils/errors/exception.dart';
import '../../../../core/utils/shared_preferences.dart';

abstract class ProductDetailsBaseRemoteDataSource{
  Future<ProductDetailsModel> productDetailsData({required int id});
}
class ProductDetailsRemoteDataSource extends ProductDetailsBaseRemoteDataSource{
  final ApiService apiService;

  ProductDetailsRemoteDataSource({required this.apiService});
  @override
  Future<ProductDetailsModel> productDetailsData({required int id})async{
    var response = await apiService.get(endpoint: "products/$id",
        token: SharedPref.getToken().toString()
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> productDetails = response.data;
      return ProductDetailsModel.fromJson(productDetails);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}