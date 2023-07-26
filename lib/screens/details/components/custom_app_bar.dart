
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopy/size_config.dart';

import '../../../components/rounded_icon_btn.dart';
class CustomAppBar extends PreferredSize{
  final double? product;
  const CustomAppBar({Key? key, this.product, required Widget child, required Size preferredSize}) : super(key: key, child: child, preferredSize: preferredSize);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)),
     child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIconBtn(iconData: Icons.arrow_back, press: () => Navigator.pop(context),
           ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
             decoration: BoxDecoration(
               color:Colors.white, borderRadius: BorderRadius.circular(14),),
                child: Row(
                  children: [
                 const   Text(
                      "4.5",
                      style: TextStyle(
                        fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 5),
                   SvgPicture.asset("assets/icons/Star Icon.svg")
        

                ],
                  ),
                
  

                 

            )
          ],
      
       ),
      ),
    );

  }

}
