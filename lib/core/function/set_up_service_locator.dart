import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import 'api_service.dart';


final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService: getIt.get<ApiService>()));
}
