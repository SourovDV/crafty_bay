import 'package:crafty_bay/app/appPages.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  void moveToSignInPage(){
    Get.toNamed(AppPages.signInScreen);
  }
  void moveToOtpPage(){
    Get.toNamed(AppPages.otpScreen);
  }
}