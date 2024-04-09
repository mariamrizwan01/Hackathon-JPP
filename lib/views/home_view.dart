import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/resource/images.dart';
import 'package:hackathon/views/home_controller.dart';
import 'package:hackathon/views/widgets/CustomCard.dart';
import '../../resource/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    return Scaffold(
      appBar: AppBar(
        title: Text(homeController.getCurrentDayAndDate()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let’s make a \nhabits together  🙌",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(
                        heading: "Application Design",
                        title: 'UI Design Kit',
                        progress: 50),
                    CustomCard(
                        heading: "Overlay Design",
                        title: 'UI Design Kit',
                        progress: 60),
                    CustomCard(
                        heading: "Application Design",
                        title: 'UI Design Kit',
                        progress: 50),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Progress",
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
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Container(
                        height: 100,
                        width: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            top: 20,
                          ),
                          child: Row(
                            children: [
                              const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Productivity Mobile App",
                                      style: TextStyle(
                                          color: AppColors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Create Detail Booking",
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "5 min ago",
                                      style: TextStyle(
                                          color: AppColors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                              Spacer(),
                              Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Image.asset(AppImages.progressCircle))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.secondary,
    );
  }
}
