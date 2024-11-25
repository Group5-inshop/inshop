import 'package:flutter/material.dart';
import 'package:inshop/screens/login.dart';
import 'package:inshop/screens/register.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showLogin = true;

  void toggglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLogin) {
    return Login(onTap: toggglePages);
  }
  else{
    return Register(onTap: toggglePages);}
  }
}