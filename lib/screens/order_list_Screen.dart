import 'package:flutter/material.dart';
import 'package:inshop/models/order.dart';
import 'package:inshop/screens/order_details_screen.dart';

class OrderListScreen extends StatelessWidget {
  final List<Order> orders = [
    // ... sample order data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text(order.customerName),
            subtitle: Text('Total: \$${order.totalAmount.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailScreen(order: order),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
