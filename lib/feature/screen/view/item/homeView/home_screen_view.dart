import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/screen/view/item/homeView/carosul.dart';
import 'package:crafty_bay/feature/screen/view/item/product_item_view/common_popular_item.dart';
import 'package:crafty_bay/feature/screen/view/item/categories/common_categories_item.dart';
import 'package:crafty_bay/feature/screen/view/widget/slider_icon.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller/home_controller.dart';
import 'package:crafty_bay/feature/screen/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class HomeScreenView extends GetView<HomeController> {
   const HomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              buildRow(),
              SizedBox(height: 10.h),
              buildTextFormField(),
              SizedBox(height: 20.h),
              CarousalSlider(),
              SizedBox(height: 10.h),
              CommonSliderIcon(controller: controller),
              SizedBox(height: 10.h),
              //all categories
              itemSection(theme: theme, name:context.localizations.allCategories, onTap: () {
              controller.moveTo();
              },),
              SizedBox(height: 20.h),
              allCategories(),
              SizedBox(height: 20.h),
              //popular
              itemSection(theme: theme, name: context.localizations.popular, onTap: () {  },),
              SizedBox(height: 20.h),

              allProducts(),
              SizedBox(height: 20.h),
              //special
              itemSection(theme: theme, name: context.localizations.special, onTap: () {  },),
              SizedBox(height: 20.h),
              allProducts(),
              //new
              itemSection(theme: theme, name: context.localizations.notun, onTap: () {  },),
              SizedBox(height: 20.h),
              allProducts()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox allProducts() {
    return SizedBox(
              height: 250.h,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CommonPopularItem();
                },
              ),
            );
  }

  SizedBox allCategories() {
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoriesController.list.length,
        itemBuilder: (context, index) {
          if (controller.categoriesController.categoryProgress.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.categoriesController.list.isEmpty) {
            return Center(child: Text("No Data"));
          }

          return Obx(()=>Visibility(
              visible: controller.categoriesController.categoryProgress.value == false,
              replacement: CircularProgressIndicator(),
              child: CategoriesItem(category: controller.categoriesController.list[index],)));
        },
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.15),
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(ImagePath.signInLogo),
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.people_alt, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.call, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class itemSection extends StatelessWidget {
  const itemSection({
    super.key,
    required this.theme, required this.name, required this.onTap,
  });

  final TextTheme theme;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
           name,
          style: theme.titleLarge?.copyWith(fontSize: 22.sp),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            context.localizations.seeAll,
            style: theme.titleSmall?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
