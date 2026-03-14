import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/screen/view/item/categories/common_categories_item.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/categories_controller/categories_controller.dart';
import 'package:crafty_bay/feature/screen/view/item/home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(onPressed: (){
                controller.moveToHome();
              }, icon: Icon(Icons.arrow_back)),
              Text("Categories"),
            ],
          ),
        ),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
          itemBuilder: (context,index){
            return CategoriesItem();
          })
    );
  }
}
