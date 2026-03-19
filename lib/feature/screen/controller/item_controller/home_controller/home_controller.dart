import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller/carosel_slider_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/item_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  SliderController sliderController = Get.find<SliderController>();
  void moveTo (){
     Get.find<ItemController>().selectIndex.value=1;
  }

}