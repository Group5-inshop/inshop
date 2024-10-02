import 'package:flutter/material.dart';
import 'package:inshop/pages/skeleton.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async {
  // await Supabase.initialize(
  //   url: 'https://awwjjwinvonirpxcqvpx.supabase.co',
  //   anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3d2pqd2ludm9uaXJweGNxdnB4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc3ODQzNTcsImV4cCI6MjA0MzM2MDM1N30.z-XSsq6agjR-HY1zmYOmIHTy8abFk3YlUkI1vUyZttw',
    
  // );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider(create: (context) => NavProvider()),
        ],
        child: ListenableProvider(
          create: (context) => NavProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Inshop',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
            ),
            home: Skeleton(),
          ),
        ));
  }
}
