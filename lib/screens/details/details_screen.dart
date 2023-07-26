// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shopy/models/cm_product.dart';
import 'components/custom_app_bar.dart';



class DetailsScreen extends StatelessWidget {
  const DetailsScreen({ Key? key }) : super(key: key);
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
   
    final Object? arguments = ModalRoute.of(context)!.settings.arguments;


    return const Scaffold(
      
      backgroundColor: Color(0xFFF5F6F9),
      
      appBar: CustomAppBar(child: Text('aaaa'),preferredSize: Size(100, 100)),

     
      );
  }
}




class ProductDetailsArguments {
  
  final Product product;

  ProductDetailsArguments({required this.product});
  
}

