import 'package:flutter/material.dart';
import 'package:inshop/pages/accounts.dart';
import 'package:inshop/pages/business.dart';
import 'package:inshop/pages/home.dart';
import 'package:inshop/pages/login.dart';

class NavProvider extends ChangeNotifier {
  Widget currentWidget = Login();

  int index = 1;

  // NavProvider({
  //   this.currentWidget = const Placeholder(),
  // });

  Future<void> changePage({required Widget widget}) async {
    currentWidget = widget;
    print(currentWidget);
    print('updated');
    notifyListeners();
  }

  int get getIndex => index;
  Future <void> changeBottomNav({required Widget page}) async {
    if (page is Business) {
      index = 0;
      changePage(widget: Business());
      notifyListeners();
    } else if (page is Home) {
      index = 1;
      changePage(widget: Home());
      notifyListeners();
    } else if (page is Accounts) {
      index = 2;
      changePage(widget: Accounts());
      notifyListeners();
    }
  }
}
