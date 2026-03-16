import 'package:crafty_bay/feature/screen/controller/item_controller/product_item_controller/single_product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class IncrementDecrement extends StatelessWidget {
  const IncrementDecrement({
    super.key,
    required this.controller,
  });

  final SingleProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
