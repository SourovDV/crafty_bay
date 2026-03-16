import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarousalSlider extends StatelessWidget {
  const CarousalSlider({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 250.h,viewportFraction: 0.8,autoPlayCurve: Curves.easeInOut,onPageChanged: (index,reason){
        controller.initialIndex.value = index;
      }),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: AppColor.colorPrimary,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('text $i', style: TextStyle(fontSize: 16.0),))
            );
          },
        );
      }).toList(),
    );
  }
}
