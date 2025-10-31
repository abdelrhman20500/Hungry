import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/function/set_up_service_locator.dart';
import 'package:hungry/features/auth/data/repo/auth_repo_impl.dart';
import 'package:hungry/features/auth/domain/use_case/register_use_case.dart';
import 'package:hungry/features/auth/presentation/view/login_screen.dart';
import 'package:hungry/features/auth/presentation/view_manager/register_cubit/register_cubit.dart';
import 'package:hungry/features/auth/presentation/view_manager/register_cubit/register_state.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/utils/loading_dialog.dart';
import '../../../../core/utils/success_dialog.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../layout/presentation/view/layout_screen.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  static const String routeName ="RegisterScreen";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   final nameController = TextEditingController();
   final phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterUseCase(getIt.get<AuthRepoImpl>())),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoading){
            showLoadingDialog(context);
          }else if(state is RegisterFailure){
            closeLoadingDialog(context);
            showErrorDialog(context, state.error);
          }else if(state is RegisterSuccess){
            closeLoadingDialog(context);
            showSuccessDialog(context, state.authModel.message!);
            Future.delayed(const Duration(milliseconds: 1500), () {
              Navigator.pushNamed(context, LayoutScreen.routeName);
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff08431D),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.05,),
                      Center(
                        child: Image.asset("assets/images/image 1.png", height: height*0.16,
                            width: width*0.5, fit: BoxFit.fill),
                      ),
                      SizedBox(height: height * 0.02),
                      const Center(
                        child: Text(
                          "Welcome To Hungry",
                          style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      const Text(
                        "Name",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Name",
                        controller: nameController,
                        suffixIcon: const Icon(Icons.edit, size: 32),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "Email",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Email",
                        controller: emailController,
                        suffixIcon: const Icon(Icons.email_outlined, size: 32),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "Phone",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Phone",
                        controller: phoneController,
                        suffixIcon: const Icon(Icons.phone, size: 32),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        hintText: "Enter Your Password",
                        controller: passwordController,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined, size: 32),
                      ),
                      SizedBox(height: height * 0.05),
                      Container(
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: CustomTextButton(
                            text: "Sign Up",
                            onTab: () {
                              if(formKey.currentState!.validate()){
                                BlocProvider.of<RegisterCubit>(context).register(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    phoneController.text
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(width: width * 0.01),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.routeName);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
