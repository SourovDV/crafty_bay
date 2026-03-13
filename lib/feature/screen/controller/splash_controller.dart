import 'package:crafty_bay/app/appPages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
    Future<void> moveToSignInPage()async{
      await Future.delayed(Duration(seconds: 2));
      Get.toNamed(AppPages.signInScreen);
    }

    @override
  void onReady() {
    moveToSignInPage();
    super.onReady();
  }
}