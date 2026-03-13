import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/screen/utils/image_path.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(child: Image.asset(ImagePath.logo)),
            Spacer(),
            CircularProgressIndicator(color: Colors.green,),
            SizedBox(height: 10.h),
            Text("${context.localizations.version}"),
            SizedBox(height: 10.h,)
          ],
        ),
    );
  }
}
