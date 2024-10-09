import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  BottomNavigationScreen({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(0, 0, 0, 0.541),
      unselectedItemColor: Colors.black,
      currentIndex: currentIndex,
      selectedLabelStyle: const TextStyle(
        fontSize: 18.0, // Size for selected label
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14.0, // Size for unselected label
        fontWeight: FontWeight.bold,
      ),
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.store,
            size: 36.0,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Orders',
          icon: Icon(
            Icons.work_history_outlined,
            size: 36.0,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Wishlist',
          icon: Icon(
            Icons.favorite_border,
            size: 36.0,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Alerts',
          icon: Icon(
            Icons.notification_important_outlined,
            size: 36.0,
          ),
        )
      ],
    );
  }
}
