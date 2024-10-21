import 'package:flutter/material.dart';
import 'package:inshop/Screens/product%20_update_screen.dart';
import 'package:inshop/models/product.dart';
import 'package:inshop/screens/product_create_screen.dart';
import 'package:inshop/screens/product_list_screen.dart';
// Assuming a ProductService

void main() {
  runApp(const InshopApp());
}

class InshopApp extends StatelessWidget {
  const InshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inshop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductListScreen(),
      routes: {
        '/create-product': (context) => ProductCreateScreen(),
        '/update-product': (context) => ProductUpdateScreen(
              product: ModalRoute.of(context)!.settings.arguments as Product,
            ),
      },
    );
  }
}
