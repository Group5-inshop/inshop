import 'package:flutter/material.dart';
import 'package:inshop/models/product.dart';
import 'package:inshop/screens/product_create_screen.dart';
import 'package:inshop/screens/product_list_screen.dart';
import 'package:inshop/screens/product_update_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inshop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
      routes: {
        '/create-product': (context) => const ProductCreateScreen(),
        '/update-product': (context) => ProductUpdateScreen(
              product: ModalRoute.of(context)!.settings.arguments as Product,
            ),
        '/product-detail': (context) => ProductDetailScreen(
              product: ModalRoute.of(context)!.settings.arguments as Product,
            ),
      },
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the UI for displaying product details (name, description, price, image)
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
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
