import 'package:flutter/material.dart';
import 'package:inshop/widgets/custom_app_bar.dart';
import 'package:inshop/widgets/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final supabase = Supabase.instance.client;
  int _selectedIndex = 0; // Track the selected index
  final List<Map<String, dynamic>> _cartItems = []; // List to store cart items

  // Fetch products by category from Supabase
  Future<List<Product>> _fetchProducts(String category) async {
    try {
      final data = await supabase
          .from('product')
          .select('id, product_name, price, rating, imageUrl')
          .limit(10);

      if ((data as List).isEmpty) return [];

      return (data as List<dynamic>)
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  void _addToCart(String productId, double price) async {
    try {
      // Fetch product details, including product name and imageUrl
      final response = await supabase
          .from('product')
          .select('product_name, imageUrl')
          .eq('id', productId)
          .single();

      // Safely access product name and imageUrl
      final productName = response['product_name'] ?? 'Unknown Product';
      final imageUrl =
          response['imageUrl'] ?? 'https://via.placeholder.com/150';

      // Insert into cart
      final cartResponse = await supabase.from('cart').insert({
        'product_id': productId,
        'product_name': productName, // Add product_name
        'imageUrl': imageUrl,
        'price': price,
        'quantity': 1,
      });

      if (cartResponse.error == null) {
        setState(() {
          _cartItems.add({
            'id': productId,
            'imageUrl': imageUrl,
            'productName': productName, // Store productName in cartItems
            'price': price,
          });
        });
        print('Product added to cart');
      } else {
        print('Error adding to cart: ${cartResponse.error.message}');
      }
    } catch (e) {
      print('Error adding product to cart: $e');
    }
  }

  Widget _buildCategoryView(String category) {
    return FutureBuilder<List<Product>>(
      future: _fetchProducts(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final product = snapshot.data![index];
            return Product(
              id: product.id,
              title: product.title,
              rating: product.rating,
              price: product.price,
              imageUrl: product.imageUrl,
              onAddToCart: () => _addToCart(product.id, product.price),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      body: _buildCategoryView('cars'), // Default category
    );
  }
}
