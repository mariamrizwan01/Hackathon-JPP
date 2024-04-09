import 'package:get/get.dart';
import 'package:hackathon/resource/colors.dart';

class Utils {
  static void toastMessage(String message) {
    Get.snackbar(
      'Message',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.secondary,
      colorText: AppColors.primary,
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      duration: const Duration(seconds: 2),
    );
  }
}
