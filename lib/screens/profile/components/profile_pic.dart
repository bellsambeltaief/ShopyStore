// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
      
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.jpg"),
            ),
            Positioned(
              right: -12,
              bottom: 0,
              child: SizedBox(
                height: 46 ,
                width:46 ,
                child: TextButton(
                
                  onPressed: (){},
                  child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                ),
                ),
            ),
        ],
      ),
    );
  }
}