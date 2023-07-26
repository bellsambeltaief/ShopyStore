import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/screens/otp/components/otp_form.dart';
import 'package:shopy/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text("OTP Verification", style: headingStyle),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              const Text("We sent your code to your e-mail"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will be expired in"),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:$value",
            style: const TextStyle(color: Colors.deepOrangeAccent),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
