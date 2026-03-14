import 'package:crafty_bay/app/appPages.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  void moveToSignUpPage(){
    Get.toNamed(AppPages.signUpScreen);
  }
  void moveToItemScreen(){
    Get.toNamed(AppPages.itemScreen);
  }

}