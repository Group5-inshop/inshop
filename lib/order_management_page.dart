// order_management_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'order_service.dart';
import 'order.dart';

class OrderManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderService = Provider.of<OrderService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Orders'),
      ),
      body: ListView.builder(
        itemCount: orderService.orders.length,
        itemBuilder: (context, index) {
          final order = orderService.orders[index];
          return ListTile(
            title: Text('Order ID: ${order.id}'),
            subtitle:
                Text('Product ID: ${order.productId}, Status: ${order.status}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                orderService.deleteOrder(order.id);
              },
            ),
            onTap: () {
              // Navigate to order details or edit page
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to add new order
          _showAddOrderDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddOrderDialog(BuildContext context) {
    final TextEditingController productIdController = TextEditingController();
    final TextEditingController customerIdController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productIdController,
                decoration: InputDecoration(labelText: 'Product ID'),
              ),
              TextField(
                controller: customerIdController,
                decoration: InputDecoration(labelText: 'Customer ID'),
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final newOrder = Order(
                  id: DateTime.now().toString(), // Generate a unique ID
                  productId: productIdController.text,
                  customerId: customerIdController.text,
                  quantity: int.parse(quantityController.text),
                  status: 'Pending', // Default status
                );
                Provider.of<OrderService>(context, listen: false)
                    .addOrder(newOrder);
                Navigator.of(context).pop();
              },
              child: Text('Add Order'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
