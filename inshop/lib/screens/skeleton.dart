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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 80, // Height of the circular navigation bar
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50), // Fully circular
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5), // Shadow below the navigation bar
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            backgroundColor: Colors.transparent, // No direct background
            elevation: 0, // Remove default shadow
            type: BottomNavigationBarType.fixed, // Always show labels
            selectedItemColor: Colors.green, // Highlight selected item
            unselectedItemColor: Colors.black, // Default black for unselected
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
                label: 'SeLL',
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
        ),
      ),
    );
  }
}
