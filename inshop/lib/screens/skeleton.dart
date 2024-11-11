import 'package:flutter/material.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:provider/provider.dart';

class Skeleton2 extends StatelessWidget {
  const Skeleton2({super.key});

  
  @override
  Widget build(BuildContext context) {
    Widget page = context.watch<NavProvider>().currentWidget;
    return Center(
      child: page,
    );
  }
}
