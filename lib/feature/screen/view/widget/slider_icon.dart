import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller/carosel_slider_controller.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class CommonSliderIcon extends StatelessWidget {
  const CommonSliderIcon({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0;
        i < controller.sliderController.list.length;
        i++)
          Container(
            margin: EdgeInsets.only(left: 5),
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.sliderController.initialIndex.value == i
                  ? AppColor.colorPrimary
                  : Colors.grey.withOpacity(0.6),
            ),
          ),
      ],
    ));
  }
}
