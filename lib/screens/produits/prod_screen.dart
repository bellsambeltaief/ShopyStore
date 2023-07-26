import 'package:flutter/material.dart';
import 'package:shopy/screens/produits/components/body.dart';


class ProduitScreen extends StatelessWidget {
  const ProduitScreen({ Key? key }) : super(key: key);
  static String routeName = "/prod";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Text("\t \t \t \t \t \t   Products" ,
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,), 
        textAlign: TextAlign.center,  ),
      ),
      body: const Body(),

    );
  }
}