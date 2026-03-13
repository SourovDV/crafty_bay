import 'package:crafty_bay/feature/screen/controller/splash_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}