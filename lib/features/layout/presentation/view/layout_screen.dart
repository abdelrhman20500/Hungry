import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hungry/features/cart/presentation/view/cart_screen.dart';
import '../../../favorite/presentation/view/favorite_screen.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../view_manager/nav_bar_cubit.dart';
import '../view_manager/nav_bar_state.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  static const String routeName ="LayoutScreen";
  final List<Widget> tabs=[
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(
                child: tabs[cubit.currentIndex]
            ),
            bottomNavigationBar: Container(

              decoration: const BoxDecoration(
                  color: Color(0xff08431D)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: GNav(
                    onTabChange: (index) {
                      cubit.changeIndex(index); // Update the index here
                    },
                    rippleColor:Colors.white, // tab button ripple color when pressed
                    hoverColor: const Color(0xff08431D), // tab button hover color
                    haptic: true, // haptic feedback
                    tabBorderRadius: 15,
                    duration: const Duration(milliseconds: 180), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: Colors.grey, // unselected icon color
                    activeColor: Colors.white, // selected icon and text color
                    iconSize: 30, // tab button icon size
                    // tabBackgroundColor:Colors.blue, // selected tab background color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // navigation bar padding
                    tabs: const[
                      GButton(icon: Icons.home,),
                      GButton(icon: Icons.shopping_cart_outlined,),
                      GButton(icon: Icons.favorite,),
                      GButton(icon: Icons.person,),
                    ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
