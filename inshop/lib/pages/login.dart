import 'package:flutter/material.dart';
import 'package:inshop/widgets/mytextfield.dart';

class Login extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        
      ),
      body: ListView(
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
              padding: EdgeInsets.only(left: 8, right: 8),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary),
                ),
                onPressed: () {},
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
                Text('Already have an account? '),
                SizedBox(width: 20),
                GestureDetector(
                    child: Text(
                  'REGISTER',
                ))
              ],
            ),
          ]),
    );
  }
}
