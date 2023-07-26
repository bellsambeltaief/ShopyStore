// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopy/models/cm_cart.dart';
import 'package:shopy/models/cm_product.dart';
import 'package:shopy/screens/cart/components/cart_item_card.dart';
import 'package:shopy/size_config.dart';



class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    ProductList productList = Provider.of<ProductList>(context, listen: false);

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount:  cart.size(),
        itemBuilder: (context, index) =>
         Padding(
           padding:  const EdgeInsets.symmetric(vertical: 10),
           child: Dismissible(
              key: Key(cart.idByIndex(index).toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                color: const Color(0xfffffe6e6),
                borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],),
              ),
              onDismissed: (direction){
                setState(() {
                  cart.remove(cart.idByIndex(index));
                });
              },
              child: CartItemCard(product: productList.getProductById(cart.idByIndex(index))!, quantity: cart.quantityByIndex(index)),
            ),
         ), ),
    );
     
    
  }
}

