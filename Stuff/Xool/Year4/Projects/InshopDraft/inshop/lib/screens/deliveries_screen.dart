import 'package:flutter/material.dart';
import 'package:inshop/screens/alert_screen.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/screens/home_screen.dart';
import 'package:inshop/screens/orders_screen.dart';
import 'package:inshop/screens/sell_screen.dart';
import 'package:inshop/widgets/bottom_navigation.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final int _selectedIndex = 3;
  String userId = 'your_user_id'; // Replace with the actual userId

  // Sample data for deliveries
  final List<Map<String, dynamic>> deliveries = [
    {
      'orderID': '12345',
      'status': 'In Transit',
      'productName': 'Wireless Headphones',
      'deliveryDate': '2024-11-10',
      'recipient': 'John Doe',
      'trackingNumber': 'TRK123456'
    },
    {
      'orderID': '12346',
      'status': 'Delivered',
      'productName': 'Smartphone',
      'deliveryDate': '2024-11-03',
      'recipient': 'Jane Smith',
      'trackingNumber': 'TRK123457'
    },
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>
                const HomeScreen(), // Pass userId here
          ),
          (route) => false,
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OrdersScreen()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SellScreen()),
        );
        break;
      case 3:
        // Already on Deliveries
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Deliveries',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 36),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_sharp, size: 36),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notification_important_outlined, size: 36),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AlertsScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Your Deliveries',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: deliveries.length,
                itemBuilder: (context, index) {
                  return _buildDeliveryTile(deliveries[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Define _buildDeliveryTile method
  Widget _buildDeliveryTile(Map<String, dynamic> delivery) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${delivery['orderID']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Product: ${delivery['productName']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              'Status: ${delivery['status']}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              'Delivery Date: ${delivery['deliveryDate']}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Recipient: ${delivery['recipient']}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tracking No: ${delivery['trackingNumber']}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add tracking functionality
                  },
                  icon: const Icon(Icons.track_changes),
                  label: const Text('Track'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
