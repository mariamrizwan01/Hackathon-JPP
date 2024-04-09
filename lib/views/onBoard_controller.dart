import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/resource/images.dart';
import 'package:hackathon/resource/route_name.dart';
import 'package:hackathon/utils/shared_perf.dart';

class OnBoardController extends GetxController {
  List Page = [
    {
      'image': AppImages.onBoardImage1,
      'subtitle': 'Lets create a space for your workflows.'
    },
    {
      'image': AppImages.onBoardImage2,
      'subtitle': 'Work more Structured and Organized 👌'
    },
    {
      'image': AppImages.onBoardImage3,
      'subtitle': 'Manage your Tasks quickly for Results✌'
    },
  ];
  var currentIndex = 0.obs;
  var pageController = PageController();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentIndex.value = pageController.page!.toInt();
      log(currentIndex.value.toString());
    });
  }

  void navToSignIn() async {
    isLoading(true);
    String? id = await SharedPref.readValue('id');
    if (id != '') {
      Get.offAllNamed(RouteName.home);
    } else {
      Get.offAllNamed(RouteName.signIn);
    }
    // Get.offAllNamed(RouteName.signIn);
    isLoading(false);
  }
}
