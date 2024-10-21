// product_list_screen.dart
import 'package:flutter/material.dart';
import 'package:inshop/Screens/product_create_screen.dart';
import 'package:inshop/models/product.dart';
import 'package:inshop/services/product_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  final ProductService productService =
      ProductService(); // ProductService instance

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final products = await productService.fetchProducts();
      setState(() {
        this.products = products;
      });
    } catch (error) {
      // Handle error, show a snackbar or dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch products')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inshop Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.price.toStringAsFixed(2)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, '/update-product',
                        arguments: product);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteProduct(product);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-product');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> deleteProduct(Product product) async {
    try {
      await productService.deleteProduct(product.id);
      fetchProducts(); // Update product list after deletion
    } catch (error) {
      // Handle error, show a snackbar or dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to delete product')),
      );
    }
  }
}
