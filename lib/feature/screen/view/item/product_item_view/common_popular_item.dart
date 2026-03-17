import 'package:crafty_bay/feature/screen/controller/item_controller/product_item_controller/common_popular_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonPopularItem extends GetView<CommonPopularItemController> {
  const CommonPopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:controller.moveToPopularDetails,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 160.w,
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
          mainAxisSize: MainAxisSize.min,
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
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
      ),
    );
  }
}
