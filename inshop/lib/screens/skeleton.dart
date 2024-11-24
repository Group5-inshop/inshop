import 'package:flutter/material.dart';
import 'package:inshop/screens/accounts.dart';
import 'package:inshop/screens/home_screen.dart';
import 'package:inshop/screens/orders_screen.dart';
import 'package:inshop/screens/product_list_screen.dart';
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
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 227, 245, 228),
          indicatorColor: const Color.fromARGB(255, 89, 149, 104),
          labelTextStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(color: Color.fromARGB(255, 63, 107, 74)),
          ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) =>
              setState(() => currentIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.business_outlined,
                  color: Color.fromARGB(255, 89, 149, 104)),
              label: 'Business',
              selectedIcon: Icon(Icons.business,
                  size: 35, color: Color.fromARGB(255, 194, 243, 200)),
            ),
            NavigationDestination(
              icon: Icon(Icons.sell_outlined,
                  color: Color.fromARGB(255, 89, 149, 104)),
              label: 'Sell',
              selectedIcon: Icon(Icons.add_circle_outline_rounded,
                  size: 35, color: Color.fromARGB(255, 194, 243, 200)),
            ),
            NavigationDestination(
              icon: Icon(Icons.home_outlined,
                  color: Color.fromARGB(255, 89, 149, 104)),
              label: 'Orders',
              selectedIcon: Icon(Icons.work_history,
                  size: 35, color: Color.fromARGB(255, 194, 243, 200)),
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined,
                  color: Color.fromARGB(255, 89, 149, 104)),
              label: 'Subsription',
              selectedIcon: Icon(Icons.account_circle,
                  size: 35, color: Color.fromARGB(255, 194, 243, 200)),
            ),
          ],
        ),
      ),
    );
  }
}
