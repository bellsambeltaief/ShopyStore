import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/screens/payme/payme_screen.dart';
import '../../../size_config.dart';


class OtpForm extends StatefulWidget {
  const OtpForm({ Key? key }) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  initState(){
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }
  
 @override
 void dispose(){
   super.dispose();
 }

  void nextField({required String value, required FocusNode focusNode}){
    if (value.length == 1) {
      focusNode.requestFocus();
    }

  }
 
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin2FocusNode);
                },
                 
              ),
              ),
               SizedBox(
                
                 width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin2FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin3FocusNode);
                },
                 
              ),
              ),
               SizedBox(width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin3FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin4FocusNode);
                },
                 
              ),
              ),
               SizedBox(width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin4FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  
                  pin4FocusNode.unfocus();
                },
                 
              ),
              ),
            ],
          ),
          SizedBox(
                       width: getProportionateScreenWidth(190),
           child: ElevatedButton(
            onPressed: () {
             Navigator.popAndPushNamed(context, PaymentScreen.routeName);
             // LoginState.instance.login();
    
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepOrangeAccent, // Background color
  ),
  child: const Text(
    'Continue',
    style: TextStyle(fontSize: 10),
  ),
),),
           SizedBox(height: SizeConfig.screenHeight * 0.15),
          
         
        ],
      ),
      
    );
  }
}


