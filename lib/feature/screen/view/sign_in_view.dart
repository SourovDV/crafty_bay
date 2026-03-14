import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/common/common_next_button.dart';
import 'package:crafty_bay/feature/screen/controller/sign_in_controller.dart';
import 'package:crafty_bay/feature/screen/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

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
            Text(context.localizations.welcomeBack, style: theme.titleLarge),
            SizedBox(height: 5.h),
            Text(
              context.localizations.pleaseEnterYourEmailAddress,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 10.h),
            buildTextFormField(context),
          ],
        ),
      ),
    );
  }

  Form buildTextFormField(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(decoration: InputDecoration(hintText: "Email Address")),
          SizedBox(height: 5.h),
          TextFormField(decoration: InputDecoration(hintText: "Password")),
          SizedBox(height: 15.h),
          CommonNextButton(text: 'Next', call: () {controller.moveToItemScreen();}),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.localizations.doNotHaveAnAccount),
              SizedBox(width: 5.w),
              InkWell(
                onTap: controller.moveToSignUpPage,
                child: Text(
                  context.localizations.signUp,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
