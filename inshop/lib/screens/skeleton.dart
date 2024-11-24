import 'package:flutter/material.dart';
import 'package:inshop/screens/accounts.dart';
import 'package:inshop/screens/home_screen.dart';
import 'package:inshop/screens/orders_screen.dart';
import 'package:inshop/screens/sell_screen.dart';

class Skeleton2 extends StatefulWidget {
  const Skeleton2({super.key});

  @override
  State<Skeleton2> createState() => _Skeleton2State();
}

class _Skeleton2State extends State<Skeleton2> {
  int currentIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const SellScreen(),
    const OrdersScreen(),
    const Accounts(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Colors.green, // Highlight color for selected items
        unselectedItemColor: Colors.black, // Color for unselected items
        type: BottomNavigationBarType.fixed, // Keep labels always visible
        selectedLabelStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.store_outlined,
              size: 30.0,
            ),
            activeIcon: Icon(
              Icons.store,
              size: 36.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Sell',
            icon: Icon(
              Icons.add_circle_outline_rounded,
              size: 30.0,
            ),
            activeIcon: Icon(
              Icons.add_circle,
              size: 36.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Orders',
            icon: Icon(
              Icons.work_history_outlined,
              size: 30.0,
            ),
            activeIcon: Icon(
              Icons.work_history,
              size: 36.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Subscription',
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30.0,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              size: 36.0,
            ),
          ),
        ],
      ),
    );
  }
}
