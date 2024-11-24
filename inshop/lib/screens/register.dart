import 'package:flutter/material.dart';
import 'package:inshop/services/authservices.dart';
import 'package:inshop/services/formservices.dart';
import 'package:inshop/widgets/mytextfield.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Authservices authservice = Authservices();

  


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
                Icons.person,
                size: 72.0,
                color: Theme.of(context).colorScheme.primaryFixedDim,
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                validator: nameValidator(),
                controller: _firstnameController,
                obscure: false,
                labelText: 'Firstname',
                hintText: '',
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                validator: nameValidator(),
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
                validator: emailValidator(),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: _phonenumberController,
                obscure: false,
                labelText: 'Phone number',
                hintText: '',
                validator: phoneValidator(),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                validator: passwordValidator(),
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
                    authservice.register(_emailController, _passwordController, _firstnameController, _lastnameController, _phonenumberController, context);
                    widget.onTap!();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registration successful'),
                        duration: Duration(seconds: 10),
                      ),
                    );

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
                        widget.onTap!();
                      })
                ],
              ),
            ]),
      ),
    );
  }
}
