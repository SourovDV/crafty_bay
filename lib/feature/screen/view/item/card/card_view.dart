import 'package:crafty_bay/feature/screen/controller/item_controller/card_controller/card_controller.dart';
import 'package:crafty_bay/feature/screen/view/widget/increment_decrement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardView extends GetView<CardController> {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Column(
        children: [

          /// Cart List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.05),
                      )
                    ],
                  ),
                  child: Row(
                    children: [

                      /// Product Image
                      Image.network(
                        "https://i.imgur.com/8Km9tLL.png",
                        width: 70,
                      ),

                      const SizedBox(width: 12),

                      /// Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "New Year Special Shoe",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.delete_outline)
                              ],
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              "Color: Red, Size: X",
                              style: TextStyle(color: Colors.grey),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [

                                const Text(
                                  "\$100",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),

                                /// Quantity
                              IncrementDecrement()
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          /// Bottom Checkout Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xffDDE8EA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Total Price"),
                    SizedBox(height: 5),
                    Text(
                      "\$100,000.00",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    )
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Checkout"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}