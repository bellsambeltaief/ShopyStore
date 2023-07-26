import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/screens/sign_in/components/sign_form.dart';
import 'package:shopy/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../components/no_account_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Spacer(
      flex: 1,
    );

    return SizedBox(
      width: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            Text(
              "\n Welcome Back",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Sign in with your email and password \n or continue with social media",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.08,
            ),
            const SignForm(),
            const SizedBox(
              height: 8,
            ),
            const NoAccountText(),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: const Text(
                "Contact US",
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                launchUrl(Uri(scheme: 'mailto', path: adminMail));
              },
            ),
          ],
        ),
      ),
    );
  }
}
