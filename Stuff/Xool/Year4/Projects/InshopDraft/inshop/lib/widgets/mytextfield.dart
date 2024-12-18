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
      height: 57,
      width: 150,
      padding: const EdgeInsets.only(left: 23, right: 25),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10)),
            fillColor: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
