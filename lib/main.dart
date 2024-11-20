import 'package:flutter/material.dart';
import 'package:inshop/screens/order_list_screen.dart';

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
      home: OrderListScreen(),
    );
  }
}
