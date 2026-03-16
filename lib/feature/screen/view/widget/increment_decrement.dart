import 'package:crafty_bay/feature/screen/controller/item_controller/product_item_controller/single_product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class IncrementDecrement extends StatelessWidget {
  const IncrementDecrement({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    RxInt initialData = 0.obs;
    void increment(){
      initialData++;
    }
    void decrement(){
      initialData--;
    }
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: IconButton(
            onPressed: () {
              if (initialData > 0) {
                return decrement();
              }
            },
            icon: Icon(Icons.remove, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Obx(
                () => Text(initialData.toString()),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: IconButton(
            onPressed: () {
              if (initialData < 15) {
                return increment();
              }
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
