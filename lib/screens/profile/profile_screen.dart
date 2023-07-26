// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopy/enums.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../models/cm_user.dart';
import 'components/body.dart';



class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CmUser>(context, listen: false).getUser);
    return Scaffold(

      appBar: AppBar(

        title: const Text(" \t \t \t \t \t \t \t  Profile" ,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),),

      ),
      
       body: const Body(),
       bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile,
       ),);
  }
}


