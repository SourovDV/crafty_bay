import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/core/extension.dart';
import 'package:crafty_bay/feature/common/carosul.dart';
import 'package:crafty_bay/feature/common/categories_item.dart';
import 'package:crafty_bay/feature/common/slider_icon.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller.dart';
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
              CarousalSlider(controller: controller),
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

              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return popularItem();
                  },
                ),
              ),
              SizedBox(height: 20.h),
              //special
              itemSection(theme: theme, name: context.localizations.special, onTap: () {  },),
              SizedBox(height: 20.h),
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return popularItem();
                  },
                ),
              ),

              //new
              itemSection(theme: theme, name: context.localizations.notun, onTap: () {  },),
              SizedBox(height: 20.h),
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return popularItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container popularItem() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffcfe3e6),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Padding(padding: EdgeInsets.all(10), child: Text("sfs")),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Year Special Shoe 30",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$100",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.amber),
                        SizedBox(width: 2),
                        Text("4.8", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Icon(Icons.favorite_border, size: 16, color: Colors.teal),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox allCategories() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return CategoriesItem();
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
