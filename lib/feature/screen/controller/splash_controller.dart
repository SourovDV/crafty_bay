import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/feature/screen/controller/AuthController/authController.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
    Future<void> moveToSignInPage()async {
      await Future.delayed(Duration(seconds: 2));
      AuthController authController = Get.find<AuthController>();
      bool isUserLoggedIn = await authController.isLoggedIn();
      if (isUserLoggedIn) {
        Get.toNamed(AppPages.itemScreen);
      } else{
        Get.toNamed(AppPages.signInScreen);
    }
    }

    @override
  void onReady() {
    moveToSignInPage();
    super.onReady();
  }
}