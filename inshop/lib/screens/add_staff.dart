import 'package:flutter/material.dart';
import 'package:inshop/services/formservices.dart';
import 'package:inshop/services/staffservice.dart';
import 'package:inshop/widgets/mybutton.dart';
import 'package:inshop/widgets/mytextfield.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {

  final TextEditingController _emailController = TextEditingController();

  final StaffService staffservice = StaffService();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 95, 163, 98),
        title: const Text('Invite Staff', style: TextStyle(color: Color.fromARGB(255, 194, 243, 200)),),
        leading: 
          IconButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 89, 149, 104),
            ),)
        
      ),
      body: Center(
        child: ListView(
              physics: const BouncingScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              children: [
                const SizedBox(
                  height: 70,
                ),
                Icon(
                  Icons.person_add,
                  size: 72.0,
                  color: Theme.of(context).colorScheme.primaryFixedDim,
                ),
                const SizedBox(
                  height: 70,
                ),
                MyTextField(
                  validator: emailValidator(),
                  controller: _emailController,
                  obscure: false,
                  labelText: 'Email',
                  hintText: '',
                ),
                
                const SizedBox(
                  height: 30,
                ),
                Mybutton(
                  text: 'Invite',
                  onPressed: () async {
                    staffservice.inviteStaff(_emailController.text, context);
                  }
                ),
                const SizedBox(
                  height: 20,
                ),
               
              ]),
      ),
      
    );
  }
}