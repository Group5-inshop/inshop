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

  List<Widget> pages = [const Business(), const Home(), const Accounts()];

  Future<void> changePages(Widget page) async {
    await context.read<NavProvider>().changePage(widget: page);
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<NavProvider>().index2 == 0) {
      return Container(
        alignment: AlignmentDirectional.bottomCenter,
        height: 0,
        width: 0,
      );
    } else {
      return BottomNavigationBar(
        onTap: (int newIndex) async {
          print(_currentIndex);
          setState(() {
            _currentIndex = newIndex;
          });
          context.read<NavProvider>().changePage(widget: pages[newIndex]);
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
}
