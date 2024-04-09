import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/resource/route_name.dart';
import 'package:hackathon/views/widgets/CustomButton.dart';

import '../../resource/colors.dart';
import '../../resource/images.dart';

class ArtBoard extends StatelessWidget {
  const ArtBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          AppImages.artBoard,
          height: Get.height * 0.55,
          width: Get.width,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: Get.height * 0.5,
              width: Get.width,
              decoration: const BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary2,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Taskey",
                    style: TextStyle(
                      fontSize: 52,
                      color: AppColors.primary2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const AutoSizeText(
                    "Building Better Workplaces ",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    minFontSize: 42,
                    maxFontSize: 58,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Create a unique emotional story that \ndescribes better than words",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomButton(
                        title: "Get Started",
                        onPressed: () {
                          Get.offAllNamed(RouteName.onBoard);
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
