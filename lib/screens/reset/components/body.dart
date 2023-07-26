
import 'package:flutter/cupertino.dart';
import 'package:shopy/screens/reset/components/reset_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.email}) : super(key: key);
  final String email;
  

  @override
  Widget build(BuildContext context) {
   
    return Padding(
        
      padding:  EdgeInsets.symmetric(
        horizontal:getProportionateScreenWidth(28),

         ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            // SizedBox(height: SizeConfig.screenHeight * 0.1),
            Text("Change Your Password",
            style: headingStyle,
            ),
            // SizedBox(height: SizeConfig.screenHeight * 0.1),
                const Text("Enter your  New Password",
           textAlign: TextAlign.center,
           ),

            SizedBox(height: SizeConfig.screenHeight * .1),
             ResetForm(email: email),
           
            // SizedBox(height: SizeConfig.screenHeight * 0.15),
          //      Row(
          //    mainAxisAlignment: MainAxisAlignment.center, 
             
          //    children: [

          //    ],
          //  ),
           
          
          ],
        ),
      ),
    );
  }
}
