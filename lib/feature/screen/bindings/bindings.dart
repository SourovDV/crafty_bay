import 'package:crafty_bay/feature/screen/controller/sign_in_controller.dart';
import 'package:crafty_bay/feature/screen/controller/splash_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(SignInController());
  }

}