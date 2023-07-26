import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/screens/favoris/favoris_screen.dart';
import '../enums.dart';
import '../models/cm_user.dart';
import '../screens/home/home_screen.dart';
import '../screens/sign_in/profile_sign_in.dart';

 class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key, 
    required this.selectedMenu,
  }) : super(key: key);
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    CmUser user = Provider.of<CmUser>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          ),
        boxShadow: [
          BoxShadow(offset: const Offset(0, -15),
          blurRadius: 20,
          color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
          ],
      ) ,
      child: SafeArea(
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceAround ,
          children: [
            IconButton(
             icon: SvgPicture.asset(
               "assets/icons/Shop Icon.svg", 
               color: MenuState.home ==
                selectedMenu 
                ?kPrimaryColor
                :inActiveIconColor ,),
                onPressed: () => (MenuState.home == selectedMenu)?null:Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
             icon: SvgPicture.asset(
               "assets/icons/Heart Icon.svg", 
               color: MenuState.favourite ==
                selectedMenu 
                ?kPrimaryColor
                :inActiveIconColor ,),
                onPressed: () {
               if(user.getEmail == ""){
                      final snackBar = SnackBar(
                      content: const Text('you need to be logged in!'),
                      action: SnackBarAction(
                      label: 'Undo',
                      textColor: Colors.deepOrangeAccent,
                      onPressed: () {
                      // Some code to undo the change.
                      },
                      ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 return;
               }
               (MenuState.favourite == selectedMenu )?null:Navigator.pushNamed(context, FavoriteScreen.routeName).then((value) => Navigator.pushNamed(context, HomeScreen.routeName));
    },
    ),

    IconButton(
    icon: SvgPicture.asset(
    "assets/icons/User Icon.svg",
    color: MenuState.profile ==
    selectedMenu
    ?kPrimaryColor
        :inActiveIconColor ,),
    onPressed: () =>(MenuState.profile == selectedMenu)?null:Navigator.pushNamed(context, ProfileSignIn.routeName),
    ),


    ],
    ),
    )
    );
    }
}
