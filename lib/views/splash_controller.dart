import 'package:get/get.dart';
import 'package:hackathon/resource/route_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(RouteName.artBoard);
    });
  }
}
