import 'package:flutter/material.dart';
import 'package:inshop/widgets/bottomnav.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Text('Accounts'),
        ),
        bottomNavigationBar: Bottomnav());
  }
}
