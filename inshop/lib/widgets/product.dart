import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  ProductScreen({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270, // Adjusted height to fit all content
      width: 175,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the left
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              'assets/House.jpg',
              fit: BoxFit.cover, // Maintain aspect ratio
              height: 150, // Image height
              width: double.infinity, // Full width
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              'Asset GWX 2026',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_border_purple500_rounded,
                    size: 18,
                    color: Colors.orange,
                  ),
                  Text(
                    '5.1 Review',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '\$500,000',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8), // Space before buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(15, 189, 189, 189),
                  foregroundColor: Colors.black87,
                  side: const BorderSide(
                    color: Color.fromARGB(193, 82, 81, 81),
                    width: 1.0,
                  ),
                  minimumSize: const Size(69, 28), // Set the button size
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Aligns icon and text to the center
                  children: [
                    Icon(
                      Icons.shopping_cart_rounded, // Replace with any icon you want to use
                      size: 16, // Adjust the icon size as needed
                    ),
                    SizedBox(
                        width: 4), // Adds some space between the icon and text
                    Text(
                      'Add',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(69, 28), // Set the button size
                ),
                onPressed: () {},
                child: const Text(
                  'Buy',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
