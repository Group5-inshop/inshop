import 'package:flutter/material.dart';
import 'package:inshop/widgets/alert.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Alerts',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          AlertTile(
            icon: Icons.work_history_outlined,
            title: 'Order',
            message: 'Client ordered a product.',
            timestamp: '2h',
            onNavigate: () {
              // Define navigation action for this alert
             // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen()));
            },
          ),
          const SizedBox(height: 10.0),
          AlertTile(
            icon: Icons.delivery_dining_outlined,
            title: 'Delivery',
            message: 'Your product arrived.',
            timestamp: '5h',
            onNavigate: () {
              // Define navigation action for this alert
             // Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryDetailsScreen()));
            },
          ),
          const SizedBox(height: 10.0),
          AlertTile(
            icon: Icons.shop_2_outlined,
            title: 'New product',
            message: 'New iPhone going at 400k.',
            timestamp: '1d',
            onNavigate: () {
              // Define navigation action for this alert
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
