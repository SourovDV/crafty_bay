import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/common/carosul.dart';
import 'package:crafty_bay/feature/common/slider_icon.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/product_item_controller/single_product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SingleProductDetails extends GetView<SingleProductDetailsController> {
  const SingleProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product Details"),
        leading: const Icon(Icons.arrow_back),
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250.h,
                viewportFraction: 1,
                autoPlayCurve: Curves.easeInOut,
                onPageChanged: (index, reason) {
                  controller.initialIndex.value = index;
                },
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   for (int i = 0; i < 5; i++)
                     Obx(
                           () => Container(
                         margin: EdgeInsets.only(left: 5),
                         width: 20.w,
                         height: 20.h,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: controller.initialIndex.value == i
                               ? AppColor.colorPrimary
                               : Colors.white
                         ),
                       ),
                     ),
                 ],
               ),
             )

          ],),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  /// title + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Happy New Year Special Deal Save 30%",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: IconButton(
                              onPressed: () {
                                if (controller.initialData > 0) {
                                  return controller.decrement();
                                }
                              },
                              icon: Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Obx(
                              () => Text(controller.initialData.toString()),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: IconButton(
                              onPressed: () {
                                if (controller.initialData < 15) {
                                  return controller.increment();
                                }
                              },
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// rating
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text("4.8"),
                      SizedBox(width: 10),
                      Text("Reviews", style: TextStyle(color: Colors.teal)),
                      SizedBox(width: 10),
                      Icon(Icons.favorite_border, color: Colors.teal),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// color
                  const Text(
                    "Color",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      _colorCircle(Colors.black),
                      _colorCircle(Colors.teal, selected: true),
                      _colorCircle(Colors.brown),
                      _colorCircle(Colors.grey.shade300),
                      _colorCircle(Colors.grey),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// size
                  const Text(
                    "Size",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      _sizeBox("X"),
                      _sizeBox("XL", selected: true),
                      _sizeBox("2L"),
                      _sizeBox("X"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// description
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          /// bottom price section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xffe8f4f4),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Price"),
                    Text(
                      "\$1,000",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Add To Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// color circle
  Widget _colorCircle(Color color, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected ? Border.all(color: Colors.teal, width: 2) : null,
      ),
      child: CircleAvatar(radius: 12, backgroundColor: color),
    );
  }

  /// size box
  Widget _sizeBox(String text, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.teal : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(color: selected ? Colors.white : Colors.black),
      ),
    );
  }
}
