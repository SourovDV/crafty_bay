import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/feature/data/userModel/otp_model.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  RxString otp = "".obs;
  bool get isValid => otp.value.length == 4;
  RxBool otpProgress = true.obs;

  void otpSubmit(OtpModel model){
    if(!isValid){
      Get.snackbar('Error', 'Please enter 4 digit OTP');
      return;
    }
    otpRequest(model);
  }


  Future<void> otpRequest(OtpModel model)async{
    NetworkCaller networkCaller = Get.find<NetworkCaller>();
    otpProgress.value = true;
    NetworkResponse response =await networkCaller.postRequest(url: AppUrls.verifyOtp,items:model.toJson());
    otpProgress.value = false;
    if(response.isSuccess){
      Get.snackbar("success","success");
    }else{
      Get.snackbar("error",response.errorSms.toString());
    }

  }
}