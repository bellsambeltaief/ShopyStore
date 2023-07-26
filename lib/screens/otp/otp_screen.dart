import 'package:flutter/material.dart';
import 'package:shopy/screens/otp/components/body.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({ Key? key }) : super(key: key);
  static String routeName ="/otp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" \t \t \t \t OTP Verification",
         style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
         ),
        ),
        body: const Body(),
    );
  }
}