import 'package:flutter/material.dart';
import 'package:shopy/screens/reset/components/body.dart';

class ResetScreen extends StatelessWidget {

  static String routeName = "/reset";

  const ResetScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("\t \t \t   Forgot Your Password" ,
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,), 
        textAlign: TextAlign.center,  
        ),
        ),
        
      body: Body(email: email),
    );
  }
}