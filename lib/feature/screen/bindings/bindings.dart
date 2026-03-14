import 'package:crafty_bay/feature/screen/controller/item_controller/card_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/categories_controller/categories_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/categories_controller/categories_details_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/categories_controller/common_categories_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/product_item_controller/common_popular_item_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/item_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/product_item_controller/single_product_details_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/wish_controller/wish_controller.dart';
import 'package:crafty_bay/feature/screen/controller/otp_controller.dart';
import 'package:crafty_bay/feature/screen/controller/sign_in_controller.dart';
import 'package:crafty_bay/feature/screen/controller/sign_up_controller.dart';
import 'package:crafty_bay/feature/screen/controller/splash_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(SignInController());
    Get.lazyPut(()=>SignUpController());
    Get.lazyPut(()=>OtpController());
    Get.lazyPut(()=>ItemController());
    Get.lazyPut(()=>HomeController());
    Get.lazyPut(()=>CategoriesController());
    Get.lazyPut(()=>CardController());
    Get.lazyPut(()=>WishController());
    Get.lazyPut(()=>CommonCategoriesControllers());
    Get.lazyPut(()=>CategoriesDetailsController());
    Get.lazyPut(()=>SingleProductDetailsController());
    Get.lazyPut(()=>CommonPopularItemController());
    Get.lazyPut(()=>SingleProductDetailsController());

  }

}