import 'package:crafty_bay/feature/screen/view/item/product_item_view/common_popular_item.dart';
import 'package:flutter/material.dart';

class WishView extends StatelessWidget {
  const WishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Electronic"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 দিলে UI ভালো হবে
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7, // ⭐ important
          ),
          itemBuilder: (context, index) {
            return const CommonPopularItem();
          },
        ),
      ),
    );
  }
}
