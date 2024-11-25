import 'package:flutter/material.dart';

class AlertTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String timestamp;
  final VoidCallback? onNavigate; // Callback for navigation

  const AlertTile({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.timestamp,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timestamp,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: onNavigate, // Trigger the navigation callback when pressed
          ),
        ],
      ),
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black),
      ),
    );
  }
}
