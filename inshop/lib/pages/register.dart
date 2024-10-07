import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/pages/login.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/widgets/mytextfield.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Register extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Register({super.key});

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
                Icons.person,
                size: 72.0,
                color: Theme.of(context).colorScheme.primaryFixedDim,
              ),
              SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: _firstnameController,
                obscure: false,
                labelText: 'Firstname',
                hintText: '',
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: _lastnameController,
                obscure: false,
                labelText: 'Surname',
                hintText: '',
              ),
              SizedBox(
                height: 10,
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
                controller: _phonenumberController,
                obscure: false,
                labelText: 'Phone number',
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
                          width: 1.75,
                          color: const Color.fromARGB(255, 38, 122, 41)),
                      backgroundColor: const Color.fromARGB(255, 135, 192, 121),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        // Set the width of the border
                      )),
                  onPressed: () async {
                    try {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();
                      final phoneNumber = _phonenumberController.text.trim();
                      final firstname = _firstnameController.text.trim();
                      final lastname = _lastnameController.text.trim();
                      final username = firstname + ' ' + lastname;
                      // final userID = supabase.auth.currentUser!.id;
                      await supabase.auth
                          .signUp(password: password, email: email, data: {
                        'username': username,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Done'),
                          duration: Duration(seconds: 10),
                        ),
                      );

                      context.read().navProvider.currentWidget = Placeholder();
                    } on AuthException catch (error) {
                      print(
                          '''===================================================================
                      ${error.message}
                      =======================================================================''');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('error'),
                          duration: Duration(seconds: 10),
                        ),
                      );
                    } catch (error) {
                      print(supabase.auth.currentUser!.id);
                      print('''=============================================
                      
                      ${error.toString()}
                      
                      ========================================================''');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('error found'),
                          duration: Duration(seconds: 10),
                        ),
                      );
                    }
                  },
                  child: const Text('Register',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  SizedBox(width: 10),
                  GestureDetector(
                      child: Text(
                        'LOGIN',
                      ),
                      onTap: () {
                        context.read<NavProvider>().changePage(widget: Login());
                      })
                ],
              ),
            ]),
      ),
    );
  }
}
