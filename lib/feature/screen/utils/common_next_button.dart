import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonNextButton extends StatelessWidget {
  const CommonNextButton({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.colorPrimary,
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
    );
  }
}