import 'package:flutter/material.dart';
import 'package:shopy/enums.dart';
import '../../components/custom_bottom_nav_bar.dart';




class AdminScreen extends StatelessWidget {
  static String routeName = '/admin';

  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const SizedBox(
          width: 250,
          child: Text("Admin Manage" ,
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),),
        ),

      ),
       
       bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile,
       ),);
  }
}

