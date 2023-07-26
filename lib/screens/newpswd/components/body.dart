// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopy/screens/newpswd/components/new_form.dart';
import '../../../constants.dart';
import '../../../helper/invoker.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  Body(
      {Key? key,
      required this.password,
      required this.confirmPassword,
      required this.email})
      : super(key: key);
  final String password;
  final String email;
  final String confirmPassword;
  double value = 59.0;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          // child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Update Your Password ",
                    style: headingStyle,
                  ),
                  // SizedBox(height: SizeConfig.screenHeight * 0.05),
                  const Text("OTP Verification"),
                  // SizedBox(height: SizeConfig.screenHeight * 0.05),
                  const Text("We sent your code to your e-mail"),

                  // SizedBox(height: SizeConfig.screenHeight * 0.05),
                  buildTimer(),
                ],
              ),
              // SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(
                password: widget.password,
                confirmPassword: widget.confirmPassword,
              ),
              // SizedBox(height: SizeConfig.screenHeight * 0.1),

              GestureDetector(
                onTap: () {
                  Invoker.post("api/v1/auth/forgot-password/", false,
                      {"email": widget.email}).then((value) {
                    if ((value as Map<String, dynamic>)
                        .keys
                        .contains("detail")) {
                      final snackBar = SnackBar(
                        content: const Text('This email is invalid'),
                        action: SnackBarAction(
                          label: 'ok',
                          textColor: Colors.deepOrangeAccent,
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      setState(() {});
                      final snackBar = SnackBar(
                        content: const Text('OTP code has been resend'),
                        action: SnackBarAction(
                          label: 'ok',
                          textColor: Colors.deepOrangeAccent,
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                child: const Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          )),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will be expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: widget.value, end: 0),
          duration: const Duration(seconds: 59),
          builder: (context, value, child) => Text(
            "00:${(value).floor().toString().padLeft(2, '0')}",
            style: const TextStyle(color: Colors.deepOrangeAccent),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
