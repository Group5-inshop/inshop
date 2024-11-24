import 'package:flutter/material.dart';
import 'package:inshop/screens/alert_screen.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/screens/profile_screen.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(131, 76, 175, 79),  // Set the background color to green
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0), // Add padding to move the title down
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Aptos',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0), // Add consistent padding to actions
          child: IconButton(
            icon: const Icon(Icons.search, size: 36),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0), // Add consistent padding to actions
          child: IconButton(
            icon: const Icon(Icons.add_shopping_cart_sharp, size: 36),
            onPressed: () {
              const userId = 'your_user_id_here'; // Replace with the actual user ID
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartScreen(), // Pass userId here
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0), // Add consistent padding to actions
          child: IconButton(
            icon: const Icon(Icons.notification_important_outlined, size: 36),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AlertsScreen()));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 10.0), // Add padding to the PopupMenuButton
          child: PopupMenuButton<int>(
            icon: const Icon(Icons.manage_accounts_rounded, size: 38),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Logged in as Morten Msiska',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 16.0,
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.black87),
                    SizedBox(width: 8),
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black87),
                    SizedBox(width: 8),
                    Text(
                      'Log Out',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (item) {
              switch (item) {
                case 1:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
                  break;
                case 2:
                  _showLogoutDialog(context); // Show the logout dialog
                  break;
              }
            },
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add log-out functionality here
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
