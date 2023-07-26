import 'package:flutter/material.dart';
import 'package:shopy/screens/myaccount/components/body.dart';


class MyaccountScreen extends StatelessWidget {
  static String routeName = "/account";
  const MyaccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("\t \t \t \t \t \t   My Account" ,
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,), 
        textAlign: TextAlign.center,  
        ),
        ),
      
          body: const Body(
          ),
        );
  }
}