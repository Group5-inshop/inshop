import 'package:flutter/material.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  
  @override
  Widget build(BuildContext context) {
    Widget page = context.watch<NavProvider>().currentWidget;
    return Center(
      child: page,
    );
  }
}
