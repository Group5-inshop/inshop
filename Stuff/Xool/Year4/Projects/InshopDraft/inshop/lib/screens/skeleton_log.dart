import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/screens/login_register.dart';
import 'package:inshop/screens/skeleton.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {

  @override
  Widget build(BuildContext context) {

      return StreamBuilder(stream: supabase.auth.onAuthStateChange, 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final authState = snapshot.data;

        if (authState != null && authState.session != null) {
          // User is authenticated, navigate to the HomePage
          return const Skeleton2();
        } else {
          // User is not authenticated, show the AuthPage
          return const LoginRegister();
        }
      },);
   
  }
}
