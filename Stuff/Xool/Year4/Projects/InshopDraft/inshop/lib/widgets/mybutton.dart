import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
              
                      backgroundColor: const Color.fromARGB(255, 89, 149, 104),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )),
                  onPressed: () async {
                    onPressed();
                  },
                  child: Text(text,
                      style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 194, 243, 200))),
                ),
              );
  }
}