import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/pages/login.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Home'),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
                child: Text('Logout'),
                onPressed: () {
                  context.read<NavProvider>().index2 = 0;
                  supabase.auth.signOut;
                  context.read<NavProvider>().changePage(widget: Login());
                  print(
                      '${context.watch<NavProvider>().index2}  nnnnnnnnnnnnnn');
                }),
          ],
        ),
      ),
      // bottomNavigationBar: Bottomnav()
    );
  }
}
