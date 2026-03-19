import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller/carosel_slider_controller.dart';
import 'package:crafty_bay/feature/screen/view/item/card/card_view.dart';
import 'package:crafty_bay/feature/screen/view/item/categories/categories_view.dart';
import 'package:crafty_bay/feature/screen/view/item/homeView/home_screen_view.dart';
import 'package:crafty_bay/feature/screen/view/item/wish_view/wish_view.dart';
import 'package:get/get.dart';

class ItemController extends GetxController{
  RxInt selectIndex = 0.obs;

  final List item = [
    HomeScreenView(),
    CategoriesView(),
    CardView(),
    WishView()
  ];

  SliderController sliderController = Get.find<SliderController>();

  @override
  void onInit() {
    sliderController.getSlider();
    super.onInit();
  }

}