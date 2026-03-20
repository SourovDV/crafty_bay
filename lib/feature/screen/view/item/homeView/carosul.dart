import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller/carosel_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarousalSlider extends GetView<SliderController> {
  const CarousalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.sliderProgress.value == false,
        replacement: Container(
          height: 250,
          child: Center(child: CircularProgressIndicator()),
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 250.h,
            viewportFraction: 0.8,
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              controller.initialIndex.value = index;
            },
          ),
          items: controller.list.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: AppColor.colorPrimary,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(item.photo_url),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment(2, 2),
                    child: Text("$item"),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
