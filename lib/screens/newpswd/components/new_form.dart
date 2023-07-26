// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shopy/helper/invoker.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/profile_sign_in.dart';


class OtpForm extends StatefulWidget {
  const OtpForm({ Key? key , required this.password, required this.confirmPassword}) : super(key: key);
  final String password;
  final String confirmPassword;
  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String otp = "******";
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;


  @override
  initState(){
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }
  
 @override
 void dispose(){
   super.dispose();
 }
  
 String replaceCharAt(String old, int index, String newChar){
    index = index -1;
    if (newChar == ''){
      newChar = "*";
    }
    if (index == old.length){
      return old.substring(0, index) + newChar + '';
    }
    return old.substring(0, index) + newChar + old.substring(index+1);

 }
 
  void nextField({required String value, required FocusNode focusNode, required int nodeNumber}){
    if (value.length == 1) {
      focusNode.requestFocus();
      otp = replaceCharAt(otp, nodeNumber, value);

    }


  }
 
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(40),
                height: getProportionateScreenWidth(40),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin2FocusNode, nodeNumber: 1);
                },
                 
              ),
              ),
               SizedBox(
                
                 width: getProportionateScreenWidth(40),
                 height: getProportionateScreenWidth(40),

                 child: TextFormField(
                focusNode: pin2FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                   style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin3FocusNode, nodeNumber: 2);
                },
                 
              ),
              ),
               SizedBox(width: getProportionateScreenWidth(40),
                 height: getProportionateScreenWidth(40),

                 child: TextFormField(
                focusNode: pin3FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                   style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin4FocusNode, nodeNumber: 3);
                },
                 
              ),
              ),
              SizedBox(width: getProportionateScreenWidth(40),
                height: getProportionateScreenWidth(40),

                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value, focusNode: pin5FocusNode, nodeNumber: 4);
                  },
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(40),
                height: getProportionateScreenWidth(40),

                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value, focusNode: pin6FocusNode, nodeNumber: 5);
                  },

                ),
              ),
               SizedBox(width: getProportionateScreenWidth(40),
                 height: getProportionateScreenWidth(40),

                 child: TextFormField(
                focusNode: pin6FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                   style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value){
                  if(value.length == 1){
                    pin6FocusNode.unfocus();
                      otp = replaceCharAt(otp, 6, value);

                  }
                },
                 
              ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height *.1,),
          SizedBox(
                       width: getProportionateScreenWidth(190),
           child: ElevatedButton(
            onPressed: () {
                if(otp.contains("*")){
                  print(otp);
                  var snackBar = SnackBar(
                    content: const Text('please fill all fields'),
                    action: SnackBarAction(

                      label: 'ok',
                      textColor: Colors.deepOrangeAccent,
                      onPressed: () {

                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }else{
                  print(widget.confirmPassword);
                  Invoker.patch("api/v1/auth/reset-password/", false, {
                    "password": widget.password,
                    "confirm_password": widget.confirmPassword,
                    "otp_code": otp
                  }).then((value){
                    var keys = (value as Map<String, dynamic>).keys;
                    if(keys.contains("detail")){
                      var snackBar = SnackBar(
                        content: Text(value["detail"]),
                        action: SnackBarAction(

                          label: 'ok',
                          textColor: Colors.deepOrangeAccent,
                          onPressed: () {

                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }else if(keys.contains("success")){
                      var snackBar = SnackBar(
                        content: Text(value["message"]),
                        action: SnackBarAction(

                          label: 'ok',
                          textColor: Colors.deepOrangeAccent,
                          onPressed: () {

                            // Some code to undo the change.
                          },
                        ),
                      );
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                        return const ProfileSignIn();
                      }));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                }

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent, // Background color
            ),
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 10),
            ),
          ),),
                    //  SizedBox(height: SizeConfig.screenHeight * 0.15),

         
        ],
      ),
      
    );
  }
}


