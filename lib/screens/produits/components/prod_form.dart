import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/models/cm_product.dart';
import 'package:shopy/size_config.dart';
import '../../../components/product_card.dart';

class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductList>(context, listen: false).products;
    return 
    
            SizedBox(width: getProportionateScreenWidth(350),
              child: ListView.builder( 
              itemCount: products.length,
              itemBuilder: (_, index){
                return ProductCard(
                        product: products[index], press: () {
                         },);
              },),
               height: MediaQuery.of(context).size.height * 0.75,);
        
  }
}

