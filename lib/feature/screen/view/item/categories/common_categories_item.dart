import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/data/category/category_model.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/categories_controller/common_categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesItem extends GetView<CommonCategoriesControllers> {
  const CategoriesItem({this.category});
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.moveToCategoriesDetails();
      },
      child: Card(
        color: AppColor.colorPrimary.withOpacity(0.3),
        elevation: 1,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child:Column(
                children: [
                  Image.network(
                    height: 50.h,
                    width: 50.w,
                    category?.icon ?? "",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, size: 40);
                    },
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
