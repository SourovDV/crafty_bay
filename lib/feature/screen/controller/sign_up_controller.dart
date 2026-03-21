import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/feature/data/userModel/signUp_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController deliveryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  NetworkCaller networkCaller = Get.find<NetworkCaller>();
  RxBool signUpProgress = false.obs;


  void submitButton() {
    if (key.currentState!.validate()) {
      registerUser(SignUpModel(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          deliveryAddress: deliveryController.text.trim(),
          phone: phoneController.text,
          password: passwordController.text));
      print("call 3");
    }
  }
//for register user
  Future<void> registerUser(SignUpModel model) async {
    signUpProgress.value = true;
    NetworkResponse response = await networkCaller.postRequest(
        url: AppUrls.signUp, items: model.toJson());
    signUpProgress.value = false;
    if (response.isSuccess) {
      Get.toNamed(AppPages.otpScreen,arguments: emailController.text);
      Get.snackbar("success", "sfs");
    } else {
      Get.snackbar("wrong", "wrong");
    }
  }


  void moveToSignInPage() {
    Get.toNamed(AppPages.signInScreen);
  }

  void moveToOtpPage() {
    Get.toNamed(AppPages.otpScreen);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    deliveryController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}