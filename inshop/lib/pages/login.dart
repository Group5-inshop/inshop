import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/pages/home.dart';
import 'package:inshop/pages/register.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/widgets/mytextfield.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _phonenumberController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  late final StreamSubscription<AuthState> authSubscription;

  @override
  void initState() {
    authSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      // ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
            physics: BouncingScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            children: [
              SizedBox(
                height: 70,
              ),
              Icon(
                Icons.lock_open,
                size: 72.0,
                color: Theme.of(context).colorScheme.primaryFixedDim,
              ),
              SizedBox(
                height: 70,
              ),
              MyTextField(
                controller: _emailController,
                obscure: false,
                labelText: 'Email',
                hintText: '',
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: _passwordController,
                obscure: true,
                labelText: 'Password',
                hintText: '',
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: const Color.fromARGB(255, 38, 122, 41),
                        width: 1.75,
                      ),
                      backgroundColor: const Color.fromARGB(255, 135, 192, 121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )),
                  onPressed: () async {
                    try {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      await supabase.auth
                          .signInWithPassword(email: email, password: password);
                      _emailController.clear();
                      _passwordController.clear();

                      context.read<NavProvider>().changePage(widget: Home());
                    } on AuthException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error.message),
                          duration: Duration(seconds: 10),
                        ),
                      );
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error.toString()),
                          duration: Duration(seconds: 10),
                        ),
                      );
                    }
                  },
                  child: const Text('Login',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  SizedBox(width: 10),
                  GestureDetector(
                      child: Text(
                        'REGISTER',
                      ),
                      onTap: () {
                        context
                            .read<NavProvider>()
                            .changePage(widget: Register());
                      })
                ],
              ),
            ]),
      ),
    );
  }
}
