import 'package:flutter/material.dart';
import 'package:hackathon/resource/colors.dart';
import '../../resource/images.dart';

class CustomCard extends StatelessWidget {
  final String heading;
  final String title;
  final int progress;
  const CustomCard({
    super.key,
    required this.heading,
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 150,
        width: 250,
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading,
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(title,
                  style: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(image: AssetImage(AppImages.People)),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Row(
                      children: [
                        const Text("Progress",
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("${progress.toString()}/80",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.asset(AppImages.Progressbar)
                  ]),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
