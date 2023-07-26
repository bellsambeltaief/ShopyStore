import 'package:flutter/cupertino.dart';
import 'package:shopy/screens/sign_up/sign_up_screens.dart';
import '../constants.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(" Don't have an account?",
      style:  TextStyle(
        fontSize: getProportionateScreenWidth(12)),
      ),
      
      
       GestureDetector(
         onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
         child: SizedBox(
          width: 90,
           child: Text(" Sign Up",
               style:  TextStyle(
            fontSize: getProportionateScreenWidth(14), color: kPrimaryColor , fontWeight: FontWeight.bold),
               ),
         ),
       ),
    
      ],
      
    );
  }
}

