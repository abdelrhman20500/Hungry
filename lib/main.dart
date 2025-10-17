import 'package:flutter/material.dart';
import 'package:hungry/features/layout/presentation/view/layout_screen.dart';
import 'package:hungry/features/splash/presentation/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>const SplashScreen(),
        LayoutScreen.routeName:(_)=>LayoutScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

