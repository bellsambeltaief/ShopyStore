import 'package:flutter/material.dart';

import 'package:shopy/screens/favoris/components/body.dart';

class FavoriteScreen extends StatelessWidget {
 static String routeName = "/favoris";

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    
      );
    
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(" \t \t \t \t \t  Your favorites",
       style: TextStyle(color: Colors.black),
      ),
    );
  }
}