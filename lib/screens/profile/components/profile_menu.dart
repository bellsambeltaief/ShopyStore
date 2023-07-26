// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopy/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key, 
   required this.text,
   required this.icon, 
   required this.press,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal:20, vertical: 10),
      child: TextButton(
      
        onPressed: press,
       child: Row(
         children: [
           SvgPicture.asset(
             icon,
             width: 22,
             color: kPrimaryColor,
             ),
             const SizedBox(width: 20,),
             Expanded(
               child: Text(
                text,
               style: Theme.of(context).textTheme.bodyText2,
               ),
             ),
             const Icon(Icons.arrow_forward_ios),


         ],
         ),
         ),
    );
  }
}

