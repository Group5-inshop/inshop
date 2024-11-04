import 'package:flutter/material.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/login.dart';
import 'package:inshop/screens/register.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Widget page = context.watch<NavProvider>().currentWidget;
    if(context.watch<NavProvider>().currentWidget == Login() || 
    context.watch<NavProvider>().currentWidget == Register()){
      return Scaffold(
        body: page,
        );
    }
    else{
      return Scaffold(
        body: page,
        bottomNavigationBar: Placeholder(),//The bottom navigation bar
        );
    }
    
  }
}
