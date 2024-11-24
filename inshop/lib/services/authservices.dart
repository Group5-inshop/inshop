import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/Home.dart';
import 'package:inshop/screens/login_register.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Authservices {
  Future<void> login(TextEditingController emailController, 
  TextEditingController passwordController,
  BuildContext context) async {
    try {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      await supabase.auth
                          .signInWithPassword(email: email, password: password);
                      emailController.clear();
                      passwordController.clear();

                      context.read<NavProvider>().changePage(widget: const Home()); // there is supposed to be a home widget here
                    } on AuthException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("error is:  ${error.message}"),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error.toString()),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
  }

  String normal = "Done";
  late String error1;
  late String error2;
  late String messaging = '';

 Future<void> register(
  TextEditingController emailController,
  TextEditingController passwordController,
  TextEditingController firstnameController,
  TextEditingController lastnameController,
  TextEditingController phoneController,
  BuildContext context
) async {
  try {
    // Step 1: Sign up the user
    final response = await supabase.auth.signUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      data: {
        'first_name': firstnameController.text.trim(),
        'last_name': lastnameController.text.trim(),
        'phone': phoneController.text.trim(),
        'display_name': '${firstnameController.text.trim()} ${lastnameController.text.trim()}',
      },
    );

    final user = response.user;

    if (user == null) {
      throw Exception('Failed to create user.');
    }

    // Step 2: Insert profile details (if not using trigger)
    await supabase.from('profiles').insert({
      'id': user.id, // Link to auth.users.id
      'first_name': firstnameController.text.trim(),
      'last_name': lastnameController.text.trim(),
      'phone': phoneController.text.trim(),
      'role': 'customer', // Default role
    });

    
ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    
    
    print('User and profile created successfully.');
  } catch (error) {
    print('Error: $error');
  }
}


  

  Future<void> logout(BuildContext context) async { 
      supabase.auth.signOut();
      context.read<NavProvider>()
              .changePage(widget: const LoginRegister());
    }
}