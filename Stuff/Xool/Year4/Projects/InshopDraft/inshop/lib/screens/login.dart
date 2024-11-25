import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/Home.dart';
import 'package:inshop/services/authservices.dart';
import 'package:inshop/widgets/mytextfield.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  // final TextEditingController _phonenumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final Authservices authservice = Authservices(); 
 
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
            physics: const BouncingScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            children: [
              const SizedBox(
                height: 70,
              ),
              Icon(
                Icons.lock_open,
                size: 72.0,
                color: Theme.of(context).colorScheme.primaryFixedDim,
              ),
              const SizedBox(
                height: 70,
              ),
              MyTextField(
                controller: _emailController,
                obscure: false,
                labelText: 'Email',
                hintText: '',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: _passwordController,
                obscure: true,
                labelText: 'Password',
                hintText: '',
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 38, 122, 41),
                        width: 1.75,
                      ),
                      backgroundColor: const Color.fromARGB(255, 135, 192, 121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )),
                  onPressed: () async {
                    authservice.login(_emailController, _passwordController, context);
                  },
                  child: const Text('Login',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account? '),
                  const SizedBox(width: 10),
                  GestureDetector(
                      child: const Text(
                        'REGISTER',
                      ),
                      onTap: () {
                        widget.onTap!();
                       })
                ],
              ),
            ]),
      ),
    );
  }
}