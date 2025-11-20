import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/core/utils/shared_preferences.dart';
import 'package:hungry/features/favorite/data/model/add_or_remove_fav_model.dart';
import 'package:hungry/features/favorite/data/model/fav_model.dart';
import '../../../../core/utils/errors/error_message_model.dart';
import '../../../../core/utils/errors/exception.dart';

abstract class AddOrRemoveBaseRemoteDataSource{
  Future<AddOrRemoveFavModel> addOrRemoveFav({required int id});
  Future<FavModel> getFavorite();
}

class AddOrRemoveRemoteDataSource extends AddOrRemoveBaseRemoteDataSource{
  final ApiService apiService;

  AddOrRemoveRemoteDataSource({required this.apiService});
  @override
  Future<AddOrRemoveFavModel> addOrRemoveFav({required int id})async{
   var response = await apiService.postMethod("toggle-favorite",
       {
         "product_id": id,
       },
       SharedPref.getToken().toString(),
   );
   if (response.statusCode == 200){
     final Map<String, dynamic> productFav = response.data;
     print("@@@@@");
     print(productFav);
     return AddOrRemoveFavModel.fromJson(productFav);
   }else{
     throw ServerException(
       errorMessageModel: ErrorMessageModel.fromJson(response.data),
     );
   }
  }

  @override
  Future<FavModel> getFavorite()async{
    var response = await apiService.get(endpoint: "favorites",
    token: SharedPref.getToken().toString()
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> productFav = response.data;
      // print("@@@@@");
      // print(productFav);
      return FavModel.fromJson(productFav);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }

  }
}