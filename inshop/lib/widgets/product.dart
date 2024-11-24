import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String id;
  final String title;
  final double rating;
  final double price;
  final String imageUrl;
  final Function onAddToCart; // Callback for Add to Cart button

  const Product({
    super.key,
    required this.id,
    required this.title,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.onAddToCart, // Initialize the callback
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['product_name'],
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'] ?? 'https://via.placeholder.com/150',
      onAddToCart: () {}, // Placeholder callback
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: 175,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 84,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                height: 84,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, size: 18, color: Colors.orange),
                  Text(
                    '$rating Review',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '\$$price',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
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
                  minimumSize: const Size(69, 28),
                ),
                onPressed: () => onAddToCart(), // Call the callback
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_rounded, size: 16),
                    SizedBox(width: 4),
                    Text('Add', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(69, 28),
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
