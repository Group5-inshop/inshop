import 'package:flutter/material.dart';
import 'package:inshop/models/order.dart';
import 'package:inshop/screens/order_details_screen.dart'; // Assuming correct screen name

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(order.customerName),
        subtitle: Row(
          children: [
            Text('Order ID: ${order.id}'),
            const SizedBox(width: 10), // Add spacing between elements
            Text(
              order.status.toString().split('.')[1], // Extract status name
              style: TextStyle(color: _getStatusColor(order.status)),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right), // Consistent trailing icon
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailScreen(order: order),
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.grey;
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.shipped:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }
}
