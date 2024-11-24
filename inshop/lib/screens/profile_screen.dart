import 'package:flutter/material.dart';
import 'package:inshop/screens/alert_screen.dart';
import 'package:inshop/screens/home_screen.dart';
import 'package:inshop/screens/cart_screen.dart';
import 'package:inshop/screens/sell_screen.dart';
import 'package:inshop/widgets/custom_search_delegate.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int _selectedIndex = 1; // Set initial index to 1 for Profile
  String userId = 'your_hardcoded_user_id'; // Hardcoded userId

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>  const HomeScreen()),
          (route) => false,
        );
        break;
      case 1:
        // Already on Profile
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SellScreen()),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AlertsScreen()),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                const CartScreen(), // Pass the hardcoded userId here
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Settings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'User Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildDetailCard(
              title: 'Full Name',
              value: 'Morten Msiska',
              icon: Icons.person,
            ),
            _buildDetailCard(
              title: 'Email Address',
              value: 'morten.msiska@example.com',
              icon: Icons.email,
            ),
            _buildDetailCard(
              title: 'Phone Number',
              value: '+265 123 456 789',
              icon: Icons.phone,
            ),
            const SizedBox(height: 20),
            const Text(
              'Location Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildDetailCard(
              title: 'Home Address',
              value: '123 Main St, Lilongwe',
              icon: Icons.location_on,
            ),
            _buildDetailCard(
              title: 'Delivery Location',
              value: 'Set new location',
              icon: Icons.edit_location_alt,
              onTap: () {
                // Handle set delivery location
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Bank Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildDetailCard(
              title: 'Bank Name',
              value: 'Your Bank',
              icon: Icons.account_balance,
            ),
            _buildDetailCard(
              title: 'Account Number',
              value: '1234567890',
              icon: Icons.account_circle,
            ),
            const SizedBox(height: 20),
            const Text(
              'Other Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildDetailCard(
              title: 'Change Password',
              value: '********',
              icon: Icons.lock,
              onTap: () {
                // Handle change password
              },
            ),
            _buildDetailCard(
              title: 'Notification Preferences',
              value: 'Manage notifications',
              icon: Icons.notifications,
              onTap: () {
                // Handle notification preferences
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save changes
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor:
                      Colors.green, // Button color changed to backgroundColor
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white, // Text color set to white
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required String value,
    required IconData icon,
    void Function()? onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.green), // Edit icon
          onPressed: () {
            // Handle edit action
          },
        ),
        onTap: onTap,
      ),
    );
  }
}
