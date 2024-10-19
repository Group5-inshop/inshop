import 'package:flutter/material.dart';
import 'package:inshop/pages/login.dart';


class NavProvider extends ChangeNotifier {
  Widget currentWidget = Login();

  // NavProvider({
  //   this.currentWidget = const Placeholder(),
  // });

  void changePage({required Widget widget}) async {
    currentWidget = widget;
    print('updated');
    notifyListeners();
  }
}