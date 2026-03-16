import 'package:crafty_bay/app/appPages.dart';
import 'package:get/get.dart';

class SingleProductDetailsController extends GetxController{
  RxInt initialIndex = 0.obs;


  void moveToReviewPage(){
    Get.toNamed(AppPages.review);
  }

}