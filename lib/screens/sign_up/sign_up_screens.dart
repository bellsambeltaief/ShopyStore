import 'package:flutter/material.dart';
import 'package:shopy/screens/sign_up/components/body.dart';


class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: 250,
          child: Text("Sign Up" ,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,), 
          textAlign: TextAlign.center,  
          ),
        ),
        ),
        
      body: const Body(),
    );
  }
}