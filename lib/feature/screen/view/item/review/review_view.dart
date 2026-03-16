import 'package:crafty_bay/feature/screen/controller/item_controller/review_controller/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewView extends GetView<ReviewController> {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Review"),
      ),
      body: Column(
        children: [
          /// Review List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.05),
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        child: Icon(Icons.person, size: 18),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Rabbil Hasan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: 6),

                            Text(
                              "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Ipsum generator Reference site about Lorem Ipsum.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          /// Bottom Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: const BoxDecoration(
              color: Color(0xffDDE8EA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Reviews (1000)",
                  style: TextStyle(fontSize: 16),
                ),

                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    controller.moveToAddReview();
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}