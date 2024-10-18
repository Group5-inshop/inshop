import 'package:flutter/material.dart';
import 'package:inshop/widgets/bottomnav.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Text('Business'),
        ),
        // bottomNavigationBar: Bottomnav()
        );
  }
}