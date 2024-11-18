// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:inshop/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for displaying product details (name, description, price, image)
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),),
          // print(context.toString());
        title: Text('${product.name} details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Widgets to display product details
            Image.network(product.imageUrl),
            Text(product.name),
            Text(product.description),
            Text(product.price.toString()),
          ],
        ),
      ),
    );
  }
}
