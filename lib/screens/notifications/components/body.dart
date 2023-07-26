
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
         
            onPressed: (){},
             child: Row(
               children: [
                 const Expanded(child: Text("Your order has been accepted ",),
                 ),
                  SvgPicture.asset("assets/icons/Trash.svg"),


                 
                 
                
                 
                 
               ],
               
               ),
             ),
        ),
      ],
      
    );
  }
}




