import 'package:flutter/material.dart';

class StaffManagement extends StatefulWidget {
  const StaffManagement({super.key});

  @override
  State<StaffManagement> createState() => _StaffManagementState();
}

class _StaffManagementState extends State<StaffManagement> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Icon(Icons.business),
        const SizedBox(height: 20,),
        ListTile(
          leading: const Text('Manage staff', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          title: const Text('Manage staff', style: TextStyle(fontSize: 18, color: Colors.grey),),
          trailing: ElevatedButton(onPressed: (){}, child: const Text('Go to staff management'))
        ),
        ListTile(
          leading: const Text('Manage products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          title: const Text('Manage products', style: TextStyle(fontSize: 18, color: Colors.grey),),
          trailing: ElevatedButton(onPressed: (){}, child: const Text('Go to products'))
        )
      ],
    );
  }
}