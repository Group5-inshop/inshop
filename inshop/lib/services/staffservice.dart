import 'package:flutter/material.dart';
import 'package:inshop/main.dart';

class StaffService {
  bool userExists = false;
  bool isLoading = false;

  Future<void> becomeStaff() async {
    try{
      var response = await supabase.from('messages')
      .select('from')
      .eq('to', supabase.auth.currentUser!.email.toString())
      .limit(1)
      .maybeSingle();

      // response2;

      if(response != null){
         final response2 = await supabase
        .from('auth.users') 
        .select('id')
        .eq('email', response?['from'])
        .limit(1)
        .maybeSingle();

        final response3 = await supabase
                          .from('profiles') 
                          .select('business_id')  
                          .eq('id', response2?['id'])
                          .limit(1)
                          .maybeSingle(); 
        await supabase.from('profiles')
                    .update({
                    'role': 'staff',
                    'business_id': response3?['business_id']})
                    .eq('id', supabase.auth.currentUser!.id);
      }
    }
    catch(error){
      print(error);
    }
  }

  Future<void> rejectInvite() async {
    try{
      await supabase
      .from('messages')
      .update({'status': 'rejected'})
      .eq('to', supabase.auth.currentUser!.email.toString());
    }
    catch(error){
      print(error);
    }
  }

  Future<void> inviteStaff(String email, BuildContext context ) async {
    try{  
      isLoading = true;
    // Query the auth.users table for a user with the specified email
    final response = await supabase
        .from('auth.users') 
        .select('id')
        .eq('email', email.trim())
        .limit(1)
        .maybeSingle();

    // Check if the user exists
      userExists = response != null;
      isLoading = false;

      if(userExists){
        await supabase.from('messages').insert({
        'to': email.trim(),
        'from': supabase.auth.currentUser!.email.toString().trim(),
        'status': 'pending'},);
        // await supabase.from('profiles').update({'message': 'pending', 'role': 'staff'}).eq('id', response?['id']);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Member invited successfully"),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pop(context);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The user does not exist"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
      
    catch(error){
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("error is:  ${error.toString()}"),
                          duration: const Duration(seconds: 2),
                        ),
                      );
    }
  }  

  Future<void> removeStaff() async {
    try{
      await supabase.from('profiles')
                    .update({
                    'role': 'customer',
                    'business_id': null,})
                    .eq('id', supabase.auth.currentUser!.id);
    }
    catch(error){
      print(error);
    }
  }

  Future<void> getAllStaff() async {
    try{
      isLoading = true;
      final response = await supabase.from('profiles').select().eq('role', 'staff');
  }
  catch(error){
    print(error);
  }
  }

}