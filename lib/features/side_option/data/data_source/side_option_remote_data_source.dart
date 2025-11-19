import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/features/side_option/data/model/ide_option_model.dart';
import '../../../../core/utils/errors/error_message_model.dart';
import '../../../../core/utils/errors/exception.dart';
import '../../../../core/utils/shared_preferences.dart';

abstract class SideOptionBaseRemoteDataSource {
  Future<SideOptionModel> sideOptionData();
}

class SideOptionRemoteDataSource extends SideOptionBaseRemoteDataSource{
  final ApiService apiService;
  SideOptionRemoteDataSource({required this.apiService});
  @override
  Future<SideOptionModel> sideOptionData()async{
    var response = await apiService.get(endpoint: "side-options",
        token: SharedPref.getToken().toString()
    );
    if (response.statusCode == 200){
      final Map<String, dynamic> sideOption = response.data;
      print("@@@@@");
      print(sideOption);
      return SideOptionModel.fromJson(sideOption);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}