import 'package:flutter/material.dart';

class SubscriptionContainer extends StatelessWidget {
  SubscriptionContainer({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    
    return Container(
              width: 150,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 47, 100, 49), width: 2.0,),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 227, 245, 228),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text, textAlign: TextAlign.center,),
                  SizedBox(
                    height: 20,
                  ),
                    ElevatedButton(
                      onPressed: () {
                        //handle subscription
                      },
                      child: Text('Subscribe'),
                    ),
                ],
              ),
              );
  }
}