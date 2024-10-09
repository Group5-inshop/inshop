import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/Bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarScreen(),
        body: const Padding(
          padding: EdgeInsets.all(16.0), // Add padding to the body
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 20.0, // Horizontal space between items
              runSpacing: 20.0, // Vertical space between rows
              children: [
                //CartScreen(),
               // ProductScreen(),
                // Add more ProductScreen widgets as needed
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationScreen(),
      ),
    );
  }
}
