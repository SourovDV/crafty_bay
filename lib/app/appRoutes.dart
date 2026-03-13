import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/feature/screen/bindings/bindings.dart';
import 'package:crafty_bay/feature/screen/view/splash_screen_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoutes{
  static final String initialPage =AppPages.splashScreen;
  static List<GetPage> routes = [
    GetPage(name: AppPages.splashScreen, page:()=>SplashScreenView(),binding: AllBindings())
  ];
}