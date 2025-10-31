import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/presentation/view/login_screen.dart';
import 'package:hungry/features/auth/presentation/view/register_screen.dart';
import 'package:hungry/features/layout/presentation/view/layout_screen.dart';
import 'package:hungry/features/splash/presentation/view/splash_screen.dart';

import 'core/function/set_up_service_locator.dart';
import 'core/function/simple_bloc_observer.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.routeName: (_) => const SplashScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            RegisterScreen.routeName:(_)=>RegisterScreen(),
            LayoutScreen.routeName: (_) => LayoutScreen(),
          },
          initialRoute: LayoutScreen.routeName,
        );
      },
    );
  }
}
