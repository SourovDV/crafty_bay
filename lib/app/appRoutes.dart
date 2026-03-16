import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/feature/screen/bindings/bindings.dart';
import 'package:crafty_bay/feature/screen/view/item/categories/categorie_details.dart';
import 'package:crafty_bay/feature/screen/view/item/categories/common_categories_item.dart';
import 'package:crafty_bay/feature/screen/view/item/product_item_view/common_popular_item.dart';
import 'package:crafty_bay/feature/screen/view/item/item_view.dart';
import 'package:crafty_bay/feature/screen/view/item/product_item_view/single_product_details.dart';
import 'package:crafty_bay/feature/screen/view/item/review/add_review.dart';
import 'package:crafty_bay/feature/screen/view/item/review/review_view.dart';
import 'package:crafty_bay/feature/screen/view/otp_screen.dart';
import 'package:crafty_bay/feature/screen/view/sign_in_view.dart';
import 'package:crafty_bay/feature/screen/view/sign_up_screen.dart';
import 'package:crafty_bay/feature/screen/view/splash_screen_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoutes{
  static final String initialPage =AppPages.splashScreen;
  static List<GetPage> routes = [
    GetPage(name: AppPages.splashScreen, page:()=>SplashScreenView(),binding: AllBindings()),
    GetPage(name: AppPages.signUpScreen, page:()=>SignUpScreen(),binding: AllBindings()),
    GetPage(name: AppPages.signInScreen, page:()=>SignInView(),binding: AllBindings()),
    GetPage(name: AppPages.otpScreen, page:()=>OtpScreen(),binding: AllBindings()),
    GetPage(name: AppPages.itemScreen, page:()=>ItemView(),binding: AllBindings()),
    GetPage(name: AppPages.categoriesDetails, page:()=>CategoriesDetailsView(),binding: AllBindings()),
    GetPage(name: AppPages.commonCategories, page:()=>CategoriesItem(),binding: AllBindings()),
    GetPage(name: AppPages.commonPopularItem, page:()=>CommonPopularItem(),binding: AllBindings()),
    GetPage(name: AppPages.singleProductDetails, page:()=>SingleProductDetails(),binding: AllBindings()),
    GetPage(name: AppPages.review, page:()=>ReviewView(),binding: AllBindings()),
    GetPage(name: AppPages.addReview, page:()=>AddReview(),binding: AllBindings()),
  ];
}