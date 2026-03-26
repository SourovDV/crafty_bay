import 'package:crafty_bay/feature/screen/controller/item_controller/categories_controller/categories_details_controller.dart';
import 'package:crafty_bay/feature/screen/view/item/product_item_view/common_popular_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesDetailsView extends GetView<CategoriesDetailsController> {
  const CategoriesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Electronic ${controller.categoriesControllers.productlist.length }")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(
          () => GridView.builder(
            itemCount:controller.categoriesControllers.productlist.length  ,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.7, // ⭐ important
            ),
            itemBuilder: (context, index) {
              return CommonPopularItem();
            },
          ),
        ),
      ),
    );
  }
}
