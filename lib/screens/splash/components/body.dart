import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/screens/home/home_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            const Text(
              "Welcome to ShopyStore",
              style: TextStyle(
                color: Color.fromARGB(196, 0, 0, 0),
                fontSize: 30,
              ),
            ),
            const Text(
              "Let's shop!",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 25,
              ),
            ),
            SizedBox(
              width: 350,
              child: Image.asset("assets/images/splash_3.png"),
            ),
            const Spacer(flex: 3),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                fixedSize: const Size(350, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
