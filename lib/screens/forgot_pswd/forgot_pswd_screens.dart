import 'package:flutter/material.dart';
import 'package:shopy/screens/forgot_pswd/components/body.dart';


class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Forgot Password", style: TextStyle(color: Colors.black87),),
      ),
      
      body: const Body(),
      
    );
    
  }
}