import 'package:crafty_bay/feature/screen/controller/item_controller/item_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt initialIndex = 0.obs;
  void moveTo (){
     Get.find<ItemController>().selectIndex.value=1;
  }

}