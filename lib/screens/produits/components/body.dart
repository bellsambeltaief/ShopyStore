import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/models/cm_product.dart';
import 'package:shopy/screens/produits/components/prod_form.dart';
import 'package:shopy/size_config.dart';




class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
        child: Column(
          children: [
     
          SizedBox(height: getProportionateScreenWidth(30) ,), 
        Consumer<ProductList>(builder: (_, list, child){
          return const Products();
        }),
          SizedBox(height: getProportionateScreenWidth(30) ,),
        ],
          
        ),
        
      );

  }
}