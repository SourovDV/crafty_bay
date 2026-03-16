import 'package:crafty_bay/app/appPages.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController{
  void moveToAddReview(){
    Get.toNamed(AppPages.addReview);
  }
}