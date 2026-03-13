import 'package:crafty_bay/app/appRoutes.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return GetMaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('bn'), // Spanish
          ],
          locale: Locale("en"),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              titleLarge:TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold)
            ),
            inputDecorationTheme: InputDecorationThemeData(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(width: 2,color: AppColor.colorPrimary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(width: 2,color: Colors.blue),
              ),
            )
          ),
          initialRoute: AppRoutes.initialPage,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
