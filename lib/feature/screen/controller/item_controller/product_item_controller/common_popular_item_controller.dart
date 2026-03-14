import 'package:crafty_bay/app/appPages.dart';
import 'package:get/get.dart';

class CommonPopularItemController extends GetxController{
  void moveToPopularDetails(){
      Get.toNamed(AppPages.singleProductDetails);
  }
}