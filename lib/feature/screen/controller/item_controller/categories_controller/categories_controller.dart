import 'package:crafty_bay/feature/screen/controller/item_controller/item_controller.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController{
    void moveToHome(){
      Get.find<ItemController>().selectIndex.value = 0;
    }
}