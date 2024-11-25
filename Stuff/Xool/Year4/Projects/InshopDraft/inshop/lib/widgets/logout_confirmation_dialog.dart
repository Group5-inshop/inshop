import 'package:flutter/material.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const LogoutConfirmationDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Log Out',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Are you sure you want to log out?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        OutlinedButton(
          onPressed: onCancel,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color.fromARGB(188, 0, 0, 0)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cancel, color: Color.fromARGB(228, 0, 0, 0)),
              SizedBox(width: 8), // Spacing between icon and text
              Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(); // Close the dialog
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color.fromARGB(171, 0, 0, 0)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout, color: Color.fromARGB(239, 0, 0, 0)),
              SizedBox(width: 8), // Spacing between icon and text
              Text(
                'Log Out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
