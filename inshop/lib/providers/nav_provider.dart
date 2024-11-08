import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier {
  Widget currentWidget = const Placeholder();

  int index2 = 0;

  void changePage({required Widget widget}) async {
    currentWidget = widget;

    if (widget == const Placeholder() || widget == const Placeholder()) {
      index2 = 0;
      print(index2);
    } else {
      index2 = 1;
      print(index2);
    }

    print(currentWidget);
    print('updated');
    notifyListeners();
  }

  int get getIndex => index2;
}
