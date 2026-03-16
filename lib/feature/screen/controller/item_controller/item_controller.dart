import 'package:crafty_bay/feature/screen/view/item/card/card_view.dart';
import 'package:crafty_bay/feature/screen/view/item/categories/categories_view.dart';
import 'package:crafty_bay/feature/screen/view/item/home_screen_view.dart';
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
}