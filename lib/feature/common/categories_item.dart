import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.colorPrimary.withOpacity(0.3),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Icon(
          Icons.computer,
          size: 48.sp,
          color: AppColor.colorPrimary,
        ),
      ),
    );
  }
}
