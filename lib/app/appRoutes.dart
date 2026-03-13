import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/feature/screen/bindings/bindings.dart';
import 'package:crafty_bay/feature/screen/view/otp_screen.dart';
import 'package:crafty_bay/feature/screen/view/sign_in_view.dart';
import 'package:crafty_bay/feature/screen/view/sign_up_screen.dart';
import 'package:crafty_bay/feature/screen/view/splash_screen_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoutes{
  static final String initialPage =AppPages.splashScreen;
  static List<GetPage> routes = [
    GetPage(name: AppPages.splashScreen, page:()=>SplashScreenView(),binding: AllBindings()),
    GetPage(name: AppPages.signUpScreen, page:()=>SignUpScreen(),binding: AllBindings()),
    GetPage(name: AppPages.signInScreen, page:()=>SignInView(),binding: AllBindings()),
    GetPage(name: AppPages.otpScreen, page:()=>OtpScreen(),binding: AllBindings()),
  ];
}