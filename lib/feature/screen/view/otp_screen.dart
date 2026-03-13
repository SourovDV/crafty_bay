import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/common/common_next_button.dart';
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
    return Scaffold(
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
            CommonNextButton(text: 'Next', call: () {}),
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
      length: 6,
      onCompleted: (pin) => print('PIN: $pin'),
      onChanged: (value) => print('Changed: $value'),
      theme: MaterialPinTheme(
        shape: MaterialPinShape.outlined,
        cellSize: Size(56, 64),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
