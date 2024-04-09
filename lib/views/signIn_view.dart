import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hackathon/resource/colors.dart';
import 'package:hackathon/resource/icons.dart';
import 'package:hackathon/views/signIn_controller.dart';
import 'package:hackathon/views/signup_controller.dart';
import 'package:hackathon/views/widgets/CustomButton.dart';
import 'package:hackathon/views/widgets/CustomTextField.dart';

import 'home_controller.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    SignInController signInController = Get.put(SignInController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In", style: TextStyle(color: AppColors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back ",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please Inter your email address\n and password for Login",
                style: TextStyle(color: AppColors.grey, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomTextField(
                      title: "Email",
                      controller: signInController.emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomTextField(
                      title: "Password",
                      controller: signInController.passwordController,
                      isPassword: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            signInController.forgetPassword();
                          },
                          child: const Text(
                            "Forgot Password?",
                            style:
                                TextStyle(color: AppColors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  CustomButton(
                      title: "Sign In",
                      onPressed: () {
                        signInController.signIn();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign In with",
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child:
                            Center(child: SvgPicture.asset(AppIcons.appleIcon)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: SvgPicture.asset(AppIcons.googleIcon)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not Registered Yet ?",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            signInController.navToSignUp();
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                           Text("Task",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                //icon for extended menu
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white,
                    ))

                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
