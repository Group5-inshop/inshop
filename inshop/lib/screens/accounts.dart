import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/login.dart';
import 'package:inshop/screens/register.dart';
import 'package:inshop/widgets/bottomnav.dart';
import 'package:inshop/widgets/myprofilecontainer.dart';
import 'package:provider/provider.dart';

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
          SizedBox(
            height: 300,
            child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
            ElevatedButton( child: const Text("Subscription"), onPressed: () {
              print("pressed");
            }, style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(150, 350))),),
            SizedBox(width: 5,),
            ElevatedButton( child: const Text("Subscription2"), onPressed: () {
              print("pressed");
            }, style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(150, 350))),),
             SizedBox(width: 5,),
             Container(
              width: 150,
              height: 350,
              ),
            ElevatedButton( child: const Text("Subscription3"), onPressed: () {
              print("pressed");
            }, style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(150, 350))),),

          ]),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(150, 50)),
          ),child: Text('Logout'), onPressed: (){
            supabase.auth.signOut();
           context
                            .read<NavProvider>()
                            .changePage(widget: const Login());})
        ]));
        // bottomNavigationBar: Bottomnav());
  }
}
