import 'package:flutter/material.dart';

class SingleProductDetails extends StatelessWidget {
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

          /// product image
          Container(
            height: 250,
            color: Colors.grey.shade200,
            child: Center(
              child: Image.network(
                "https://freepngimg.com/thumb/shoes/28530-3-nike-shoes-transparent-background.png",
                height: 180,
              ),
            ),
          ),

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
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Row(
                        children: [
                          _qtyButton(Icons.remove),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("01"),
                          ),
                          _qtyButton(Icons.add),
                        ],
                      )
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
                      Text("Reviews",
                          style: TextStyle(color: Colors.teal)),
                      SizedBox(width: 10),
                      Icon(Icons.favorite_border, color: Colors.teal)
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// color
                  const Text("Color",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

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
                  const Text("Size",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

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
                  const Text("Description",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

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
                          color: Colors.teal),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14)),
                  onPressed: () {},
                  child: const Text("Add To Cart"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// quantity button
  Widget _qtyButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(4),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  /// color circle
  Widget _colorCircle(Color color, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected
            ? Border.all(color: Colors.teal, width: 2)
            : null,
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
      ),
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
        style: TextStyle(
            color: selected ? Colors.white : Colors.black),
      ),
    );
  }
}
