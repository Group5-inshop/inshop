import 'package:flutter/material.dart';
import 'package:inshop/widgets/cart_product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> cartItems = [];

  // Fetch all cart items from Supabase
  Future<void> _fetchCartItems() async {
    try {
      final response = await supabase
          .from('cart')
          .select('id, quantity, imageUrl, price, product_name')
          .limit(10); // Limit results to 10 items for now

      final List<Map<String, dynamic>> cartItemsList =
          List<Map<String, dynamic>>.from(response);

      setState(() {
        cartItems = cartItemsList;
      });
    } catch (e) {
      print('Error fetching cart items: $e');
    }
  }

  // Update the quantity in the cart and Supabase
  Future<void> _updateCartQuantity(String id, int newQuantity) async {
    setState(() {
      final itemIndex = cartItems.indexWhere((item) => item['id'] == id);
      if (itemIndex != -1) {
        cartItems[itemIndex]['quantity'] = newQuantity;
      }
    });

    try {
      await supabase.from('cart').update({'quantity': newQuantity}).eq('id', id);
    } catch (e) {
      print('Error updating cart quantity: $e');
    }
  }

  // Calculate the total amount
  double get totalAmount {
    double total = 0.0;
    for (var item in cartItems) {
      final price = (item['price'] as num).toDouble();
      final quantity = (item['quantity'] as num).toDouble();
      total += price * quantity;
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartProduct(
                  imageUrl: item['imageUrl'],
                  title: item['product_name'],
                  quantity: (item['quantity'] as num).toInt(),
                  price: (item['price'] as num).toDouble(),
                  onQuantityChanged: (newQuantity) {
                    _updateCartQuantity(item['id'] as String, newQuantity);
                  },
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: cartItems.isEmpty
              ? null
              : () {
                  print('Checkout with total amount: \$${totalAmount.toStringAsFixed(2)}');
                },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          child: Text(
            'Checkout for \$${totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
