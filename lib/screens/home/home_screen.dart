import 'package:flutter/material.dart';
import 'package:shopy/components/custom_bottom_nav_bar.dart';
import 'package:shopy/enums.dart';
import 'package:shopy/screens/home/components/body.dart';



class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),


    );
  }
}
