import 'package:get/get.dart';
import 'package:hackathon/resource/route_name.dart';
import 'package:hackathon/views/artBoard_view.dart';
import 'package:hackathon/views/chat_view.dart';
import 'package:hackathon/views/home_view.dart';
import 'package:hackathon/views/onBoard1_view.dart';
import 'package:hackathon/views/signIn_view.dart';
import '../../views/dashboard_view.dart';
import '../../views/signUp_view.dart';
import '../../views/splash_view.dart';

class AppRoutes {
  static List<GetPage> appRoute() {
    return [
      GetPage(
          name: RouteName.splash,
          page: () => const SplashView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.artBoard,
          page: () => const ArtBoard(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.onBoard,
          page: () => const OnBoardView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.signIn,
          page: () => const SignInView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.signUp,
          page: () => const SignUpView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.dashboard,
          page: () => const DashBoardScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.home,
          page: () => const HomeView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.chat,
          page: () => const ChatView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 1000)),
    ];
  }
}
