import 'package:flutter/material.dart';
import 'package:inshop/pages/accounts.dart';
import 'package:inshop/pages/business.dart';
import 'package:inshop/pages/home.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:provider/provider.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _currentIndex = 1;
  void changePages(Widget page) {
    context.read<NavProvider>().changePage(widget: page);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int newIndex) {
        print(_currentIndex);
        setState(() {
          _currentIndex = newIndex;
          if (_currentIndex == 0) {
            changePages(Business());
          } else if (_currentIndex == 1) {
            changePages(Home());
          } else {
            changePages(Accounts());
          }
        });
        print(_currentIndex);
      },
      currentIndex: _currentIndex,
      backgroundColor: const Color.fromARGB(255, 202, 220, 202),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
          tooltip: 'Business',
          activeIcon: Icon(Icons.business),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          tooltip: 'Home',
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
          tooltip: 'Account',
          activeIcon: Icon(Icons.account_circle),
        ),
      ],
    );
  }
}
