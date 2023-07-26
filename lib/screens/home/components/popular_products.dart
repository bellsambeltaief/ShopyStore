import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:provider/provider.dart';
import 'package:shopy/screens/produits/prod_screen.dart';
import '../../../components/product_card.dart';
import '../../../models/cm_product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({ Key? key }) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ProductList>(context, listen: false).products;
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(text: "Popular Products", press: () {
            
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const ProduitScreen())));
          }, seeMore: true,),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: (products.length > 2)?Row(
            children: [
              ...List.generate(
                3,(index) {

                    return ProductCard(
                      product: products[index], press: () {
                        
                       },);
                  
                  // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ):nil,
        )
      ],
    );
  }
}

