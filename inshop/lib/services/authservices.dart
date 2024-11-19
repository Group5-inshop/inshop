import 'package:flutter/material.dart';
import 'package:inshop/main.dart';
import 'package:inshop/providers/nav_provider.dart';
import 'package:inshop/screens/Home.dart';
import 'package:inshop/screens/login_register.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Authservices {
  Future<void> login(TextEditingController _emailController, 
  TextEditingController _passwordController,
  BuildContext context) async {
    try {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      await supabase.auth
                          .signInWithPassword(email: email, password: password);
                      _emailController.clear();
                      _passwordController.clear();

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

  Future<void> signUp(TextEditingController _emailController, 
  TextEditingController _passwordController,
  TextEditingController _firstnameController,
  TextEditingController _lastnameController,
  TextEditingController _phonenumberController) async {
    try {
      
      await supabase.auth.signUp(
          password: _passwordController.text.trim(),
          email: _emailController.text.trim(),
          // phone: _phonenumberController.text.trim(),
          data: {
            'phone': _phonenumberController.text,
            'display name':
                '${_firstnameController.text.trim()} ${_lastnameController.text.trim()}',
          }
          ); 
          messaging = normal;
          await supabase
                .from('profiles')
                .update({
                  'business_id' : '',
                  'business_name' : '',
                  'first_name' : _firstnameController.text.trim(),
                  'last_name' : _lastnameController.text.trim(),
                  'phone' : _phonenumberController.text.trim(),
                  'avatar_url' : '',
                  'subscription_id' :'' ,
                  'role' : 'customer',
                  'username' : (_firstnameController.text.trim()+_lastnameController.text.trim()).toLowerCase(),
                });
                messaging = normal;
    } on AuthException catch (error) {
      error1 = error.message;
      messaging = error1;
      
      print(
          '''===================================================================
    ${error.message}
    =======================================================================''');
      
    } catch (error) {
      error2 = error.toString();
      messaging = error2;
      
      print(supabase.auth.currentUser!.id);
      print('''=============================================
    
    ${error.toString()}
    
    ========================================================''');
      
    }
  }

  Future<void> register(
  TextEditingController _emailController, 
  TextEditingController _passwordController,
  TextEditingController _firstnameController,
  TextEditingController _lastnameController,
  TextEditingController _phonenumberController,
  BuildContext context) async {
    signUp(_emailController, 
  _passwordController,
  _firstnameController,
  _lastnameController,
  _phonenumberController);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(messaging),
          duration: const Duration(seconds: 10),
        ),
      );
  }

  Future<void> logout(BuildContext context) async { 
      supabase.auth.signOut();
      context.read<NavProvider>()
              .changePage(widget: const LoginRegister());
    }
}