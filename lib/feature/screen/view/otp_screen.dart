import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/common/common_next_button.dart';
import 'package:crafty_bay/feature/data/userModel/otp_model.dart';
import 'package:crafty_bay/feature/screen/controller/AuthController/authController.dart';
import 'package:crafty_bay/feature/screen/controller/otp_controller.dart';
import 'package:crafty_bay/feature/screen/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    AuthController authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: (){
            authController.clearData;
            Get.toNamed(AppPages.signInScreen);
          },
            child: Icon(Icons.logout)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            Image.asset(ImagePath.logo),
            SizedBox(height: 5.h),
            Text(context.localizations.enterOtpCode, style: theme.titleLarge),
            SizedBox(height: 5.h),
            Text(
              context.localizations.a4digitOtpCodeHasBeenSend,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 10.h),
            buildMaterialPinField(),
            SizedBox(height: 15.h),
           Obx(()=> Visibility(
             visible: controller.otpProgress.value==false,
             replacement: CircularProgressIndicator(),
             child: CommonNextButton(text: 'Next', call: () {
               AuthController authc = Get.find<AuthController>();
               controller.otpSubmit(OtpModel(email:controller.email, otp:controller.otp.value));
             }),
           ),),
            SizedBox(height: 10.h),
            Text(context.localizations.thisCodeWillExpireIn),
            Text(context.localizations.resendCode),
          ],
        ),
      ),
    );
  }

  MaterialPinField buildMaterialPinField() {
    return MaterialPinField(
      length: 4,
      onCompleted: (value)=>controller.otp.value = value,
      onChanged: (value) => controller.otp.value = value,
      theme: MaterialPinTheme(
        shape: MaterialPinShape.outlined,
        cellSize: Size(56, 64),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
