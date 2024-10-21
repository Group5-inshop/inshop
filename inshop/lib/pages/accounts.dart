import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/widgets/bottomnav.dart';
import 'package:inshop/widgets/myprofilecontainer.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  String phone = "";
  String phones() {
    // if (supabase.auth.currentUser!.userMetadata!['phone'] == null) {
    //   return "No phone number";
    // } else {
    //   phone = supabase.auth.currentUser!.userMetadata!['phone'];
    // }
    try {
      phone = supabase.auth.currentUser!.userMetadata!['phone'];
    } catch (e) {
      phone = "No phone numbers";
    }
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: ListView(children: [
          Icon(Icons.account_circle),
          const SizedBox(height: 10),
          Myprofilecontainer(
              textName: 'Name',
              textField: supabase.auth.currentUser!.userMetadata?['username']),
          const SizedBox(height: 10),
          Myprofilecontainer(
              textName: 'Email',
              textField: supabase.auth.currentUser!.email.toString()),
          const SizedBox(height: 10),
          Myprofilecontainer(textName: 'Phone', textField: phones()),
          SizedBox(height: 20),
          Center(
            child: Text('Subscription'),
          ),
          Divider(
            color:
                const Color.fromARGB(255, 40, 94, 67), // Color of the divider
            thickness: 2, // Thickness of the line
            indent: 20, // Left spacing
            endIndent: 20, // Right spacing
          ),
          SizedBox(
            height: 20,
          ),
        ]),
        bottomNavigationBar: Bottomnav());
  }
}
