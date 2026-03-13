import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/common/common_next_button.dart';
import 'package:crafty_bay/feature/screen/controller/sign_up_controller.dart';
import 'package:crafty_bay/feature/screen/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Image.asset(ImagePath.logo),
            SizedBox(height: 20.h),
            Text(
              context.localizations.registerYourAccount,
              style: theme.titleLarge,
            ),
            SizedBox(height: 10.h),
            Text(context.localizations.getStartedWithUsWithYour),
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
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "Email"),
          ),
          SizedBox(height: 5.h),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "First name"),
          ),
          SizedBox(height: 5.h),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "Last Name"),
          ),
          SizedBox(height: 5.h),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "Phone"),
          ),
          SizedBox(height: 5.h),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "Delivery Address"),
          ),
          SizedBox(height: 5.h),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(height: 15.h),
          CommonNextButton(
            text: "Sign Up",
            call: () {
              controller.moveToOtpPage();
            },
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.localizations.alreadyHaveAnAccount),
              SizedBox(width: 5.w),
              InkWell(
                onTap: controller.moveToSignInPage,
                child: Text(
                  context.localizations.signIn,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
