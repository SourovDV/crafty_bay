import 'package:crafty_bay/feature/screen/controller/item_controller/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>controller.item[controller.selectIndex.value],),
      bottomNavigationBar: Obx(()=>NavigationBar(
          selectedIndex:controller.selectIndex.value,
          onDestinationSelected: (index){
            controller.selectIndex.value = index;
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.home), label: "Categories"),
            NavigationDestination(icon: Icon(Icons.home), label: "Card"),
            NavigationDestination(icon: Icon(Icons.home), label: "Wish"),
          ]),)
    );
  }
}
