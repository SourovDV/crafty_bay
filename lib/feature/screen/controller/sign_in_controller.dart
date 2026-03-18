import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/feature/data/userModel/login_model.dart';
import 'package:crafty_bay/feature/data/userModel/user_model.dart';
import 'package:crafty_bay/feature/screen/controller/AuthController/authController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _key;
  void loginUser(){
    if(formKey.currentState!.validate()){
      signInUser(LoginModel(email: emailController.text, password: passwordController.text));
    }
  }

  Future<void> signInUser(LoginModel model)async{
    NetworkCaller networkCaller = Get.find<NetworkCaller>();
    NetworkResponse response =await networkCaller.postRequest(url: AppUrls.login,items: model.toJson());
    if(response.isSuccess){
      String token =await response.responsesData!["data"]["token"];
      UserModel model =await UserModel.fromJson(response.responsesData!["data"]["user"]);
      AuthController authController = Get.find<AuthController>();
      authController.saveUserData(token, model);

      Get.snackbar("success", "success");
      Get.toNamed(AppPages.itemScreen);
    }else{
      Get.snackbar("false", "wrong");
    }
  }

  void moveToSignUpPage(){
    Get.toNamed(AppPages.signUpScreen);
  }
  void moveToItemScreen(){
    Get.toNamed(AppPages.itemScreen);
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}