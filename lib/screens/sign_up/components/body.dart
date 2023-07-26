import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/screens/sign_up/components/sign_up_form.dart';
import 'package:shopy/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(28),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              const Text(
                "Complete your details or continue \n with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              const SignUpForm(),
              const SizedBox(height: 8),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Text(
                "By continuing your confirm that you agree \n with our term and Condition",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
