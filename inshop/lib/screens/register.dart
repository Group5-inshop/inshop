import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/login.dart';
import 'package:inshop/widgets/mytextfield.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _firstnameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();

  final TextEditingController _phonenumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  String normal = "Done";
  late String error1;
  late String error2;
  late String messaging;

  Future<void> signUp() async {
    try {
      await supabase.auth.signUp(
          password: _passwordController.text.trim(),
          email: _emailController.text.trim(),
          // phone: _phonenumberController.text.trim(),
          data: {
            'phone': _phonenumberController.text,
            'display name':
                '${_firstnameController.text.trim()} ${_lastnameController.text.trim()}',
          });
      messaging = normal;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } on AuthException catch (error) {
      error1 = error.message;
      print(
          '''===================================================================
    ${error.message}
    =======================================================================''');
      messaging = error1;
    } catch (error) {
      error2 = error.toString();
      print(supabase.auth.currentUser!.id);
      print('''=============================================
    
    ${error.toString()}
    
    ========================================================''');
      messaging = error2;
    }
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
            physics: const BouncingScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            children: [
              const SizedBox(
                height: 70,
              ),
              Icon(
                Icons.person,
                size: 72.0,
                color: Theme.of(context).colorScheme.primaryFixedDim,
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: _firstnameController,
                obscure: false,
                labelText: 'Firstname',
                hintText: '',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: _lastnameController,
                obscure: false,
                labelText: 'Surname',
                hintText: '',
              ),
              const SizedBox(
                height: 10,
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
                controller: _phonenumberController,
                obscure: false,
                labelText: 'Phone number',
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
                          width: 1.75,
                          color: Color.fromARGB(255, 38, 122, 41)),
                      backgroundColor: const Color.fromARGB(255, 135, 192, 121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        // Set the width of the border
                      )),
                  onPressed: () async {
                    // final userID = supabase.auth.currentUser!.id;
                    signUp();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(messaging),
                        duration: const Duration(seconds: 10),
                      ),
                    );

                    // context.read<NavProvider>().changePage(widget: Home());
                  },
                  child: const Text('Register',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  const SizedBox(width: 10),
                  GestureDetector(
                      child: const Text(
                        'LOGIN',
                      ),
                      onTap: () {
                        context.read<NavProvider>().changePage(widget: const Login());
                      })
                ],
              ),
            ]),
      ),
    );
  }
}
