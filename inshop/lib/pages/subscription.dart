import 'package:flutter/material.dart';
import 'package:inshop/main.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Icon(Icons.account_circle),
      SizedBox(
        height: 10,
      ),
      Row(children: [
        Text(
          'Name:',
          textAlign: TextAlign.left,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${supabase.auth.currentUser!.userMetadata?['username']}',
          textAlign: TextAlign.left,
        ),
      ]),
      SizedBox(
        height: 10,
      ),
      Row(children: [
        Text(
          'Email:',
          textAlign: TextAlign.left,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${supabase.auth.currentUser!.email}',
          textAlign: TextAlign.left,
        ),
      ]),
      SizedBox(
        height: 10,
      ),
      Row(children: [
        Text(
          'Phone number:',
          textAlign: TextAlign.left,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '${supabase.auth.currentUser!.phone}',
          textAlign: TextAlign.left,
        ),
      ]),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Text('Subscription'),
      ),
      Divider(
        color: const Color.fromARGB(255, 40, 94, 67), // Color of the divider
        thickness: 2, // Thickness of the line
        indent: 20, // Left spacing
        endIndent: 20, // Right spacing
      ),
      SizedBox(
        height: 20,
      ),
    ]);
  }
}
