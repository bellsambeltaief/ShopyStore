import 'package:flutter/material.dart';
import 'package:shopy/screens/newpswd/components/body.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({ Key? key , required this.password, required this.confirmPassword, required this.email}) : super(key: key);
  final String password;
  final String confirmPassword;
  final String email;
  static String routeName ="/newotp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" \t \t \t \t Forgot Password",
         style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
         ),
        ),
        body: Body(password: password, confirmPassword: confirmPassword, email: email,),
    );
  }
}