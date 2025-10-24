import 'package:flutter/material.dart';
import 'package:hungry/core/widgets/custom_text_field.dart';

import '../../../../core/widgets/custom_text_button.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  static String routeName = "LoginScreen";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff08431D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/images/image 1.png", height: height*0.16,
                  width: width*0.5, fit: BoxFit.fill),
            ),
            SizedBox(height: height * 0.03),
            const Center(
              child: Text(
                "Welcome To Hungry",
                style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
              ),
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
            SizedBox(height: height * 0.05),
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
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                  },
                  child: const Text(
                    "Forget password ?",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.08),
            Container(
              height: height * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CustomTextButton(
                  text: "Login",
                  onTab: () {},
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(width: width * 0.01),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
