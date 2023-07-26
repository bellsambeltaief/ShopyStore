import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/size_config.dart';
import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  
  const Body({Key? key, required this.email, required this.password, required this.confirmPassword}): super(key: key);

  final String email;
  final String password;
  final String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20) ),
            child: Column(
              children: [

                 SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text("Complete Profile", style: headingStyle,
                ),
                const Text("Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
                ),
                 SizedBox(height: SizeConfig.screenHeight * 0.05),
                CompleteProfileForm(email: email, password: password, confirmPassword: confirmPassword,),
                // SizedBox(height: getProportionateScreenHeight(30),),
                const Text("By continuing your confirm that you agree \n with our term and condition",
                textAlign: TextAlign.center,),

              ],

            ),
          ),
      ),
    );
  }
} 

