import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscure;
  final String labelText;
  final String hintText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.obscure,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary),
                borderRadius: BorderRadius.circular(40)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(40)),
            fillColor: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
