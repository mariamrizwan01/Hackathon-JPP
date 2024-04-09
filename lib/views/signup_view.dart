import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon/resource/colors.dart';
import 'package:hackathon/views/signup_controller.dart';
import '../../resource/icons.dart';
import 'package:hackathon/views/widgets/CustomButton.dart';
import 'package:hackathon/views/widgets/CustomTextField.dart';

import 'home_controller.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = SignUpController();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please Inter your Informatioin and\n create your account",
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
                      title: "Username",
                      controller: signUpController.usernameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomTextField(
                      title: "Email",
                      keyboardType: TextInputType.emailAddress,
                      controller: signUpController.emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomTextField(
                      title: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      controller: signUpController.passwordController,
                      isPassword: true,
                    ),
                  ),
                  CustomButton(
                    title: "Sign In",
                    onPressed: () {
                      signUpController.signUp();
                    },
                    isLoading: signUpController.isLoading,
                  ),
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
                        "Already have an account?",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            signUpController.navToSignIn();
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                             TextButton(
                          onPressed: () {
                            HomeController.home();
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
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
