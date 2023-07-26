import 'package:flutter/material.dart';
import 'package:shopy/screens/myaccount/components/account_form.dart';
import 'package:shopy/size_config.dart';



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal:getProportionateScreenWidth(28),
           ),
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: SizeConfig.screenHeight * 0.07,),
              const Text("Your Personal Data",
              textAlign: TextAlign.center,
              ),
              const AccountForm(),
             SizedBox(height:  getProportionateScreenHeight(20),),
            ],
          ),
        ),
      ),
    );
  }
}

