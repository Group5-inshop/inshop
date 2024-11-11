import 'package:flutter/material.dart';

class Myprofilecontainer extends StatelessWidget {
  const Myprofilecontainer(
      {super.key, required this.textName, required this.textField});
  final String textName;
  final String textField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 25),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$textName:',
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              textField,
              // textAlign: TextAlign.start,
            ),
          ]),
    );
  }
}
