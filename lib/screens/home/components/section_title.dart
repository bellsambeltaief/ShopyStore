import 'package:flutter/material.dart';

import '../../../size_config.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key, 
   required this.text, 
   required this.seeMore,
   required this.press,
  }) : super(key: key);
  final String text ;
  final bool seeMore;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Text( text,
          style: TextStyle(
          fontSize: getProportionateScreenWidth(18),
          color: Colors.black,

          ),
          ),
          (seeMore)?
          GestureDetector(
            onTap: press ,
            
            child: const Text("See More"),
            
            ): const Text(""),

        ],
      ),
    );
  }
}


