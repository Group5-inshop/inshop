import 'package:flutter/material.dart';
import 'package:inshop/pages/login.dart';
import 'package:inshop/pages/register.dart';

class NavProvider extends ChangeNotifier {
  Widget currentWidget = Login();

  int index2 = 0;

  // NavProvider({
  //   this.currentWidget = const Placeholder(),
  // });

  Future<void> changePage({required Widget widget}) async {
    currentWidget = widget;
    
    if (widget == Login() || widget == Register()) {
      index2 = 0;
      print(index2);
    } else {
      index2 = 1;
      print(index2);
    }
    // } else {
    //   index2 = 0;
    // }
    print(currentWidget);
    print('updated');
    notifyListeners();
  }

  // int get getIndex => index;
  // Future<void> changeBottomNav({required Widget page}) async {
  //   if (page is Business) {
  //     index = 0;
  //     changePage(widget: Business());
  //     notifyListeners();
  //   } else if (page is Home) {
  //     index = 1;
  //     changePage(widget: Home());
  //     notifyListeners();
  //   } else if (page is Accounts) {
  //     index = 2;
  //     changePage(widget: Accounts());
  //     notifyListeners();
  //   }
  // }
}
