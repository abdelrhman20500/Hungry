import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/function/api_service.dart';
import 'package:hungry/core/utils/shared_preferences.dart';
import 'package:hungry/core/widgets/custom_text_field.dart';
import 'package:hungry/features/auth/data/repo/auth_repo_impl.dart';
import 'package:hungry/features/auth/domain/use_case/log_out_use_case.dart';
import 'package:hungry/features/auth/presentation/view/login_screen.dart';

import '../../../auth/presentation/view_manager/logout_cubit/logout_cubit.dart';
import '../../../auth/presentation/view_manager/logout_cubit/logout_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff08431D),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: height*0.05,),
            const CircleAvatar(
              radius: 38,
              child: Icon(Icons.person_pin, size: 50,),
            ),
            SizedBox(height: height*0.1,),
            const CustomTextField(
              hintText: "Name",
              suffixIcon: Icon(Icons.drive_file_rename_outline),
            ),
            SizedBox(height: height*0.05,),
            const CustomTextField(
              hintText: "Email",
              suffixIcon: Icon(Icons.email),
            ),
            SizedBox(height: height*0.05,),
            const CustomTextField(
              hintText: "Password",
              suffixIcon: Icon(Icons.lock_open),
            ),
            SizedBox(height: height*0.05,),
            const CustomTextField(
              hintText: "Address",
              suffixIcon: Icon(Icons.add_business),
            ),
            SizedBox(height: height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: height*0.08,
                    width: width*0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Edit Profile", style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black
                        ),),
                        Icon(Icons.edit_note, size: 36, color: Colors.black,)
                      ],
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => LogoutCubit(LogoutUseCase(authRepo: 
                  AuthRepoImpl(apiService: ApiService(Dio())))),
                  child: BlocConsumer<LogoutCubit, LogoutState>(
                    listener: (context, state) {
                      if (state is LogoutSuccess) {
                        SharedPref.removeToken();
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      } else if (state is LogoutFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errMessage)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<LogoutCubit>(context).logout();
                        },
                        child: Container(
                          height: height * 0.08,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            color: const Color(0xff08431D),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: state is LogoutLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(Icons.logout, size: 36, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
