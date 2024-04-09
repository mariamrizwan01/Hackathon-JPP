import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/services/api_client.dart';
import '../../models/user_model.dart';
import '../../utils/utils.dart';

class SignUpController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ApiClient apiClient = ApiClient();
  bool isLoading = false;

  navToSignIn() {
    Get.back();
  }

  signUp() async {
    User user =
        User(email: emailController.text, password: passwordController.text);
    try {
      await apiClient.createUser(user);
      Utils.toastMessage("User Created Successfully");
      Get.back();
    } catch (e) {
      Utils.toastMessage("An Error Occurred + $e");
    }
  }
}
