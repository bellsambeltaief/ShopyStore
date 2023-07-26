import 'package:flutter/material.dart';
import 'package:shopy/screens/login_scuccess/components/body.dart';



class LoginSuccessScreen extends StatelessWidget {

  static String routeName = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("  Success", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
        textAlign: TextAlign.center,  ),
      ),
      body: const Body(),
    );
  }
}