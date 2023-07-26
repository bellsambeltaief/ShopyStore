import 'package:flutter/material.dart';
import 'package:shopy/screens/complete_profile/components/body.dart';



class CompleteProfileScreen extends StatelessWidget {
     static String routeName = "/complete_profile";
     const CompleteProfileScreen({Key? key, required this.email, required this.password, required this.confirmPassword}) : super(key: key);
    final String email;
    final String password;
    final String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" \t \t \t \t \t \t \t \t Sign Up",
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,), 
        textAlign: TextAlign.center,  ) ,
      ),
      body: Body(email: email, password: password, confirmPassword: confirmPassword),
      
    );
  }
}