import 'package:flutter/material.dart';
import 'package:inshop/screens/alert_screen.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/screens/profile_screen.dart';
import 'package:inshop/widgets/custom_app_bar.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';
import 'package:inshop/widgets/logout_confirmation_dialog.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final int _selectedIndex = 1; // Set initial index to 1 for Orders
  String userId = 'your_user_id';


  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => LogoutConfirmationDialog(
        onConfirm: () {
          // Add log out functionality here
        },
        onCancel: () {
          Navigator.of(context).pop(); // Close the dialog
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: const CustomAppBar(title: 'Orders'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Incoming Orders',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with actual incoming orders count
                itemBuilder: (context, index) {
                  return _buildOrderTile(
                    orderType: 'Incoming',
                    productName: 'Product ${index + 1}',
                    quantity: '${(index + 1) * 2}',
                    date: '2024-11-04',
                    sender: 'Sender ${index + 1}',
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sent Orders',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with actual sent orders count
                itemBuilder: (context, index) {
                  return _buildOrderTile(
                    orderType: 'Sent',
                    productName: 'Product ${index + 1}',
                    quantity: '${(index + 1) * 3}',
                    date: '2024-11-03',
                    recipient: 'Recipient ${index + 1}',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTile({
    required String orderType,
    required String productName,
    required String quantity,
    required String date,
    String? sender,
    String? recipient,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product: $productName',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600), // Increased font size and weight
          ),
          const SizedBox(height: 5),
          Text(
            'Quantity: $quantity',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500), // Increased font weight
          ),
          Text(
            'Date: $date',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500), // Increased font weight
          ),
          if (orderType == 'Incoming') ...[
            Text(
              'From: $sender',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500), // Increased font weight
            ),
          ] else if (orderType == 'Sent') ...[
            Text(
              'To: $recipient',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500), // Increased font weight
            ),
          ],
        ],
      ),
    );
  }
}
