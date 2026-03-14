import 'package:crafty_bay/app/appPages.dart';
import 'package:get/get.dart';

class CommonCategoriesControllers extends GetxController{
  void moveToCategoriesDetails(){
    Get.toNamed(AppPages.categoriesDetails);
  }
}