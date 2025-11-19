import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/features/topping/data/model/topping_model.dart';

import '../../../../core/utils/errors/error_message_model.dart';
import '../../../../core/utils/errors/exception.dart';
import '../../../../core/utils/shared_preferences.dart';

abstract class ToppingBaseRemoteDataSource{
  Future<ToppingModel> toppingData();
}

class ToppingRemoteDataSource extends ToppingBaseRemoteDataSource{
  final ApiService apiService;
  ToppingRemoteDataSource({required this.apiService});
  @override
  Future<ToppingModel> toppingData() async{
    var response = await apiService.get(endpoint: "toppings",
        token: SharedPref.getToken().toString()
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> topping = response.data;
      print("@@@@@");
      print(topping);
      return ToppingModel.fromJson(topping);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }

  }

}