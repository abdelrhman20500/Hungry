import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/features/auth/presentation/view/login_screen.dart';
import 'package:hungry/features/auth/presentation/view/register_screen.dart';
import 'package:hungry/features/favorite/data/data_source/add_or_remove_remote_data_source.dart';
import 'package:hungry/features/favorite/data/repo/fav_repo_impl.dart';
import 'package:hungry/features/favorite/domain/use_case/add_ore_remove_fav_use_case.dart';
import 'package:hungry/features/favorite/domain/use_case/fav_use_case.dart';
import 'package:hungry/features/favorite/presentation/view_manager/favorite_cubit.dart';
import 'package:hungry/features/layout/presentation/view/layout_screen.dart';
import 'package:hungry/features/splash/presentation/view/splash_screen.dart';
import 'core/function/set_up_service_locator.dart';
import 'core/function/simple_bloc_observer.dart';
import 'core/utils/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  setUpServiceLocator();
  Bloc.observer= SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932), // iPhone X default size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => FavoriteCubit(
              FavUseCase(favRepo: FavRepoImpl(addOrRemoveRemoteDataSource:
              AddOrRemoveRemoteDataSource(apiService: ApiService(Dio(),),),),),
              AddOrRemoveFavUseCase(favRepo: FavRepoImpl(addOrRemoveRemoteDataSource:
              AddOrRemoveRemoteDataSource(apiService: ApiService(Dio(),),),),),)..getFavorites(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              SplashScreen.routeName: (_) => const SplashScreen(),
              LoginScreen.routeName: (_) => LoginScreen(),
              RegisterScreen.routeName:(_)=>RegisterScreen(),
              LayoutScreen.routeName: (_) => LayoutScreen(),
            },
            initialRoute: SharedPref.getToken() == null ? SplashScreen.routeName: LayoutScreen.routeName,
          ),
        );
      },
    );
  }
}
