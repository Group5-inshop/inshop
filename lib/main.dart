// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'order_service.dart';
import 'order_management_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OrderService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inshop Order Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderManagementPage(),
    );
  }
}
