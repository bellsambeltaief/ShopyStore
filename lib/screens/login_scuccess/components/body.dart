import 'package:flutter/material.dart';
import 'package:shopy/screens/home/home_screen.dart';
import 'package:shopy/size_config.dart';




class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset("assets/images/success.png",
        ),
        const Spacer(),
  
         SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text("  Success", style: TextStyle(
          fontSize: getProportionateScreenWidth(30),
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        ),
        const Spacer(flex: 3,),
        
 ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, HomeScreen.routeName);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepOrangeAccent, // Background color
  ),
  child: const Text(
    'Back to Home',
    style: TextStyle(fontSize: 15 , color: Colors.white70),
  ),
),
                      
                      
               // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      
                      const Spacer(),
      ],
    );
  }
}