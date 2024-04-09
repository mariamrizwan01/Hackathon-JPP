import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hackathon/resource/colors.dart';
import 'package:hackathon/views/OnBoard_controller.dart';

import '../../resource/images.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardController onBoardController = Get.put(OnBoardController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: TextButton(
              onPressed: () {
                log(onBoardController.currentIndex.value.toString());
                if (onBoardController.currentIndex.value ==
                    onBoardController.Page.length - 1) {
                  Get.offNamed('/login');
                } else {
                  onBoardController.pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
              child: SvgPicture.asset(
                AppImages.nextButton,
                height: Get.height * 0.25,
                width: Get.width * 0.4,
              ),
            ),
          ),
          PageView.builder(
            controller: onBoardController.pageController,
            itemCount: onBoardController.Page.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    onBoardController.Page[index]['image'],
                    height: Get.height * 0.6,
                    width: Get.width,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Task Management",
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primary,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AutoSizeText(
                      onBoardController.Page[index]['subtitle'],
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                      minFontSize: 35,
                      maxFontSize: 42,
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CarouselIndicator(
                        count: onBoardController.Page.length,
                        index: onBoardController.currentIndex.value,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      onBoardController.navToSignIn();
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ],
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
