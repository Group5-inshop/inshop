import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/login_register.dart';
import 'package:inshop/services/authservices.dart';
import 'package:inshop/widgets/myprofilecontainer.dart';
import 'package:inshop/widgets/mysubscriptioncontainer.dart';
import 'package:provider/provider.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {

  Authservices authservice = Authservices();

  String phone = "";
  String phones() {

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
          backgroundColor: const Color.fromARGB(255, 95, 163, 98),
          title: const Text('Accounts', style: TextStyle(color: Colors.white)),
          actions: [ ElevatedButton( 
            child: const Text('Logout'), 
            onPressed: (){
              authservice.logout(context);
          }), const SizedBox(width: 10)] ,),
          
        body: ListView(children: [
          const Icon(Icons.account_circle, size: 102.0, color: Color.fromARGB(255, 89, 149, 104),),
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
          const Center(
            child: Text('Subscription'),
          ),
          const Divider(
            color:
                Color.fromARGB(255, 40, 94, 67), // Color of the divider
            thickness: 2, // Thickness of the line
            indent: 20, // Left spacing
            endIndent: 20, // Right spacing
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              const SizedBox(
                width: 20,),
              SubscriptionContainer( text: '''WEEKLY
              MWK12,000.00''',),
              const SizedBox(
                width: 7,),
              SubscriptionContainer( text: '''MONTHLY
              MWK45,0000.00''',),
              const SizedBox(
                width: 7,),
              SubscriptionContainer( text: '''YEARLY
              MWK520,000.00''',),
              const SizedBox(
                width: 20,),
          ]),
          ),
          const SizedBox(
            height: 20,
          ),
          
        ]));
        // bottomNavigationBar: Bottomnav());
  }
}
