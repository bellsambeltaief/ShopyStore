import 'package:flutter/material.dart';
import 'components/body.dart';





class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title:const  SizedBox(
          width: 250,
          child:  Text("Sign In" ,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,), 
          textAlign: TextAlign.center,  ),
        ),
      ),
     
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: const Body(
            
          ),
        ),
      ),
    ); 
  }
}
