import 'package:flutter/material.dart';
import 'package:inshop/models/product.dart';
import 'package:inshop/screens/product_create_screen.dart';
import 'package:inshop/screens/product_detail_screen.dart';

// ignore: use_key_in_widget_constructors
class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Solar pannels',
      description: 'original solar pannels and uncondional ones',
      price: 500000,
      imageUrl: 'https://example.com/image1.jpg',
    ),
    Product(
      id: '2',
      name: 'Computers',
      description: 'original computers and also portable',
      price: 250000,
      imageUrl: 'https://example.com/image2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INSHOP PRODUCTS'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price.toStringAsFixed(2)),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product,)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductCreateScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
