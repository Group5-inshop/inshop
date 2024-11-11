import 'package:flutter/material.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/login.dart';
import 'package:inshop/screens/register.dart';
import 'package:inshop/widgets/bottomnav.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  
  @override
  Widget build(BuildContext context) {
    Widget page = context.watch<NavProvider>().currentWidget;
    if(context.watch<NavProvider>().currentWidget == const Login() || 
    context.watch<NavProvider>().currentWidget == const Register()){
      return Scaffold(
        body: page,
        );
    }
    else{
      return Scaffold(
        body: page,
        bottomNavigationBar: const Bottomnav(),//The bottom navigation bar
        );
    }
    
  }
}
